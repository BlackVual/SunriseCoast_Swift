//
//  SignUpView.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/04/13.
//

import UIKit
protocol signUpDelegate {

}

class SignUpView:UIView{
  
    //イメージビューの定義(MVCアーキテクチャ採用のため関数外で定義)
    let imageView:UIImageView = {
        let returnImageView = UIImageView()
        return returnImageView
    }()
    let loginImageView:UIImageView = {
        let returnImageView = UIImageView()
        return returnImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setObjectAndLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setObjectAndLayout() {
//ボタン・フィールド定義
        
        //ログインボタン
        let loginButton:UIButton = {
            let returnUIButton = UIButton()
            returnUIButton.translatesAutoresizingMaskIntoConstraints = false
            returnUIButton.backgroundColor = .clear
            returnUIButton.layer.cornerRadius = 10.0
            returnUIButton.setTitle("Login　　　", for: .normal)
            returnUIButton.setTitleColor(UIColor.black, for: .normal)
        //これは遷移関数を実装した後に追記
        //            returnUIButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
            return returnUIButton
        }()
        //パスワード入力テキストフィールド
        let passwordTextField:UITextField = {
            let returnTextField = UITextField()
            returnTextField.borderStyle = .roundedRect
            returnTextField.placeholder = "パスワード"
            return returnTextField
        }()
        let userNameTextField:UITextField! = {
            let returnUserNameTextField = UITextField()
            returnUserNameTextField.borderStyle = .roundedRect
            returnUserNameTextField.placeholder = "ユーザー名"
            return returnUserNameTextField
        }()
//        let signUpViewLabel:UILabel = {
//            let returnSignUpViewLabel = UILabel()
//            returnSignUpViewLabel.text = "Welcome To Club Sunrise Coast"
//            returnSignUpViewLabel.font = returnSignUpViewLabel.font.withSize(returnSignUpViewLabel.font.pointSize*2)
//            returnSignUpViewLabel.adjustsFontSizeToFitWidth = true
//            returnSignUpViewLabel.textColor = UIColor.orange
//            returnSignUpViewLabel.backgroundColor = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 100/100)
//            return returnSignUpViewLabel
//        }()
        
//        次はテキストフィールドの上にSRC ID とかって書くラベルを追加する。
        let signUpTitleLabel1:UILabel = {
            let returnLabel = UILabel()
            returnLabel.text = "SRC ID"
            returnLabel.textColor = .white
            returnLabel.backgroundColor = .clear
            returnLabel.textAlignment = NSTextAlignment.center
            returnLabel.font = returnLabel.font.withSize(returnLabel.font.pointSize*3)
            returnLabel.adjustsFontSizeToFitWidth = true
            return returnLabel
        }()
        let signUpTitleLabel2:UILabel = {
            let returnLabel = UILabel()
            returnLabel.text = "Sunrise Coastの全てをマネージメント"
            returnLabel.textColor = .white
            returnLabel.backgroundColor = .clear
            returnLabel.textAlignment = NSTextAlignment.center
            returnLabel.font = returnLabel.font.withSize(signUpTitleLabel1.font.pointSize)
            returnLabel.font = UIFont.boldSystemFont(ofSize: returnLabel.font.pointSize)
            returnLabel.adjustsFontSizeToFitWidth = true
            return returnLabel
        }()
        
        let signUpGuideLabel:UILabel = {
            let returnLabel = UILabel()
            returnLabel.text = "-----または招待を受け取りSRCメンバーに加入-----"
            returnLabel.textColor = .white
            returnLabel.backgroundColor = .clear
            returnLabel.textAlignment = NSTextAlignment.center
//            returnLabel.font = returnLabel.font.withSize(signUpTitleLabel1.font.pointSize)
            returnLabel.font = UIFont.boldSystemFont(ofSize: returnLabel.font.pointSize)
            returnLabel.adjustsFontSizeToFitWidth = true
            return returnLabel
        }()
        
        let signUpButton:UIButton! = {
            let returnUIButton = UIButton()
            returnUIButton.setTitle("SignUp", for: .normal)
            returnUIButton.titleLabel?.font = UIFont.boldSystemFont(ofSize:returnUIButton.titleLabel?.font.pointSize ?? 100)
            returnUIButton.backgroundColor = UIColor.init(red: 193/255, green: 236/255, blue: 255/255, alpha: 100/100)
            returnUIButton.titleLabel?.adjustsFontSizeToFitWidth = true
            
            return returnUIButton
        }()


//add作業
        addSubview(imageView)
        addSubview(userNameTextField)
        addSubview(passwordTextField)
//        addSubview(signUpViewLabel)
        addSubview(loginImageView)
        addSubview(loginButton)
        addSubview(signUpTitleLabel1)
        addSubview(signUpTitleLabel2)
        addSubview(signUpGuideLabel)
        addSubview(signUpButton)

        
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
//        signUpViewLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        loginImageView.translatesAutoresizingMaskIntoConstraints = false
        signUpTitleLabel1.translatesAutoresizingMaskIntoConstraints = false
        signUpTitleLabel2.translatesAutoresizingMaskIntoConstraints = false
        signUpGuideLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
//レイアウト
        //タイトルラベル

        //ユーザー名のテキストフィールド
        userNameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75).isActive = true
        userNameTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true
        userNameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height/3).isActive = true
        userNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: UIScreen.main.bounds.width/8).isActive = true
        //ユーザー名のテキストフィールド
        passwordTextField.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 5).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor).isActive = true
        //ログインイメージビュー
        loginImageView.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor, multiplier: 0.1).isActive = true
        loginImageView.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor).isActive = true
        loginImageView.topAnchor.constraint(equalTo: passwordTextField.topAnchor).isActive = true
        loginImageView.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        //ログインボタン
        loginButton.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor, multiplier: 0.25).isActive = true
        loginButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: loginImageView.topAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: userNameTextField.trailingAnchor).isActive = true
        //背景イメージビュー
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

//        //ラベル
//        signUpViewLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
//        signUpViewLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
//        signUpViewLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height/1.25).isActive = true
//        signUpViewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        //表題ラベル
        signUpTitleLabel1.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor, multiplier: 0.75).isActive = true
        signUpTitleLabel1.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor, multiplier: 1.25).isActive = true
        signUpTitleLabel1.leadingAnchor.constraint(equalToSystemSpacingAfter: userNameTextField.leadingAnchor, multiplier: 5).isActive = true
        signUpTitleLabel1.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height/5.5).isActive = true
        //表題説明ラベル
        signUpTitleLabel2.widthAnchor.constraint(equalTo: signUpTitleLabel1.widthAnchor).isActive = true
        signUpTitleLabel2.heightAnchor.constraint(equalTo: signUpTitleLabel1.heightAnchor).isActive = true
        signUpTitleLabel2.leadingAnchor.constraint(equalTo: signUpTitleLabel1.leadingAnchor).isActive = true
        signUpTitleLabel2.topAnchor.constraint(equalTo: signUpTitleLabel1.bottomAnchor, constant: 5).isActive = true
        
        //サインアップ案内ラベル
        signUpGuideLabel.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor).isActive = true
        signUpGuideLabel.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor).isActive = true
        signUpGuideLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        signUpGuideLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        
        //サインアップボタン
        signUpButton.widthAnchor.constraint(equalTo: signUpGuideLabel.widthAnchor, multiplier: 0.5).isActive = true
        signUpButton.heightAnchor.constraint(equalTo: signUpGuideLabel.heightAnchor).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: signUpGuideLabel.leadingAnchor, constant: UIScreen.main.bounds.width/6).isActive = true
        signUpButton.topAnchor.constraint(equalTo: signUpGuideLabel.bottomAnchor, constant: 10).isActive = true
        
    }
    
    
}


