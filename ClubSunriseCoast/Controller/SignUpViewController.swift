//
//  SignUpViewController.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/01.
//

import Foundation
import UIKit
import Firebase

class SignUpViewController:UIViewController{
    
    //インスタンス化（Model）
    let signUpData = SignUpViewData()
    //インスタンス化（View）
    let signUpView = SignUpview()
    //FireBaseAuthのクラス宣言用変数
    var auth: Auth!
    //データ受け取り用変数
    var me:AppUser!
    //一時的に項目を格納する配列
    var profileTempdata:profileTempData = profileTempData(Lastname: "DammyLastName", Firstname: "DammyFirstName", DataOfBirth: "DammyDataOfBirth", MailAddress: "DammyMailAddress")
    //NSNotificationCenterを定義
    let defaultCenter = NotificationCenter.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FireBaseAuthのクラス宣言
        auth = Auth.auth()
        //delegate処理
        signUpView.delegate = self
        //Viewの追加
        viewSetup()
        
        //アプリがアクティブになったかを通知（オブザーバ）
        defaultCenter.addObserver(self, selector: #selector(self.ncAction),name: UIApplication.didBecomeActiveNotification, object: nil)
    }

    
}

extension SignUpViewController: SemimodalPresenterDelegate,signUpViewDelegate {

    //次に進むボタン押下
    func registerAcount(RegisterAcount view: SignUpview) {
        //delegate関数に引数であるViewを変数に格納
        let signInView = view
        //デリゲート処理としてViewから受け取ったオブジェクトを変数に格納
        let email = signInView.mailAddressTextField.text!
        let password = signInView.passwordTextField.text!
        
        //デリゲート処理としてViewから受け取ったオブジェクトを変数に格納
        var lastname:String = self.signUpView.lastNameTextField.text!
        var firstname:String = self.signUpView.firstNameTextField.text!
        var dateOfBirth:String = self.signUpView.dateOfBirthTextField.text!
        var mailAddress:String = self.signUpView.mailAddressTextField.text!
        
        if lastname.isEmpty {
            brankAlert(Item: "姓")
            return
        }
        
        if firstname.isEmpty {
            brankAlert(Item: "名")
            return
        }
        
        if mailAddress.isEmpty {
            brankAlert(Item: "メールアドレス")
            return
        }
        
        if dateOfBirth.isEmpty {
            brankAlert(Item: "生年月日")
            return
        }

        
        //一時的なプロフィール格納変数
        profileTempdata = profileTempData(Lastname: lastname, Firstname: firstname, DataOfBirth: dateOfBirth, MailAddress: mailAddress)
        
        //一時的にプロフィール情報を格納するStruct
        

        //-----------ユーザー登録処理----------
        auth.createUser(withEmail: email, password: password) { (result, error) in
            // errorが nil であり、resultがnilではない == user情報がきちんと取得されている。
            if error == nil, let result = result {
                //ここからメールアドレスの送信処理
                result.user.sendEmailVerification(completion: {(error) in
                    if error == nil {
                        //アラートアクションの定義
                        let alert = UIAlertController(title: "仮登録が完了しました!", message: "入力したメールアドレス宛に認証メールを送信致しました。", preferredStyle: .alert)
                        //カスタムOKボタンの追加(ハンドラー指定されているのでこのボタンが押された後の処理を記載している)
                        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
                            //アラートが消えるのと画面遷移が重ならないように0.5秒後に画面遷移するようにしてる
                               DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                // 0.5秒後に実行したい処理
//                                 self.dismiss(animated: true, completion: nil)
                                }
                        })
                        //OKボタンを押すことでアラートが表示するようにアクション指定
                        alert.addAction(okAction)
                        self.present(alert, animated: true, completion: nil)
                     
                    }
                })
            //登録情報に誤りがあった場合こちらで処理
            } else if let Error = error {
                //Fire Base側でエラー処理があった場合はプリント
                print(Error.localizedDescription)
            }
        }
}
    
    func ObjectHeightGet(presentingControllerArg: UIViewController) -> CGFloat {
        return presentingControllerArg.view.bounds.height * 0.9
        
    }
    
    //SetUp
    func viewSetup() {
        self.view = signUpView
    }
    //未入力項目があったときのアラート
    func brankAlert(Item:String){
        let alert = UIAlertController(title: "未入力の項目があります", message: "\(Item)の項目が未入力です。お確かめの上、再度入力してください。", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return
    }
    
    //アプリケーションがアクティブになった時に実行（ここではメール確認してバックグラウンドから戻ってきた時）
    @objc func ncAction(notification: Notification?){
//        -----------ユーザー登録済みかの確認----------
        //ユーザーが登録されているかの確認？っぽい
        if auth.currentUser != nil{
            auth.currentUser?.reload(completion: {error in
                if error == nil {
                    if self.auth.currentUser?.isEmailVerified == true {
                        
                        //-----------プロフィール情報登録処理----------
                        
                        //FireBaseのコレクション定義
                        let saveDocument = Firestore.firestore().collection("plofile").document()
                        saveDocument.setData([
                            "lastname": self.profileTempdata.lastname,
                            "firstname": self.profileTempdata.firstname,
                            "dataOfBirth": self.profileTempdata.dataOfBirth,
                            "mailAddress": self.profileTempdata.mailAddress,
                                "senderID": self.auth.currentUser?.uid,
                                "createdAt": FieldValue.serverTimestamp(),
                                "updatedAt": FieldValue.serverTimestamp()
                            ]) { error in
                                if error == nil {
                                    let alert = UIAlertController(title: "登録完了！", message: "登録が完了しました。Welcome to CSC!!!", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                                    //自身のオブザーバを解除
                                    self.defaultCenter.removeObserver(self)
                                }
                            }
                    } else if self.auth.currentUser?.isEmailVerified == false {
                        let alert = UIAlertController(title: "まだメール認証が完了していません。", message: "確認用メールを送信しているので確認をお願いします。", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                } else {
                    print("メールアドレスをユーザーが確認したかの更新でエラーとなった\(error?.localizedDescription)")
                }
            })
        } else {
            print(auth.currentUser)
        }
    }
}
