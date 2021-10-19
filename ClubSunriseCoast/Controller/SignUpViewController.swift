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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FireBaseAuthのクラス宣言
        auth = Auth.auth()
        //delegate処理
        signUpView.delegate = self
        //Viewの追加
        viewSetup()
        //背景画像セット
//        imageSetUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //ユーザーが登録されているかの確認？っぽい
        if auth.currentUser != nil{
            auth.currentUser?.reload(completion: {error in
                if error == nil {
                    if self.auth.currentUser?.isEmailVerified == true {
                        print("MyPageへいく処理")
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

extension SignUpViewController: SemimodalPresenterDelegate,signUpViewDelegate {
    func registerAcount(RegisterAcount view: SignUpview) {
        //delegate関数に引数であるViewを変数に格納
        let signInView = view
        //デリゲート処理としてViewから受け取ったオブジェクトを変数に格納
        let email = signInView.mailAddressTextField.text!
        let password = signInView.passwordTextField.text!
        //ここからユーザー情報登録処理
        auth.createUser(withEmail: email, password: password) { (result, error) in
            // errorが nil であり、resultがnilではない == user情報がきちんと取得されている。
            if error == nil, let result = result {
                //ここからメールアドレスの送信処理
                result.user.sendEmailVerification(completion: {(error) in
                    if error == nil {
//                        アラートアクションの定義
                        let alert = UIAlertController(title: "仮登録が完了しました!", message: "入力したメールアドレス宛に認証メールを送信致しました。", preferredStyle: .alert)
//                        カスタムOKボタンの追加(ハンドラー指定されているのでこのボタンが押された後の処理を記載している)
                        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
                            //アラートが消えるのと画面遷移が重ならないように0.5秒後に画面遷移するようにしてる
                               DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                // 0.5秒後に実行したい処理
//                                 self.dismiss(animated: true, completion: nil)
                                }
                        })
//                        OKボタンを押すことでアラートが表示するようにアクション指定
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
    
//    //SetUp
//    func imageSetUp() {
//        signUpView.imageView.image = signUpData.image
//    }

    
}
