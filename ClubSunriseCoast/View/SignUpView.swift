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
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        self.backgroundColor = .white
        setObjectAndLayout()
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
        var mailAddressTextField:UITextField! = {
            let returnTextField = UITextField()
            returnTextField.borderStyle = .roundedRect
            returnTextField.placeholder = "メールアドレス"
            return returnTextField
        }()
        let signUpViewLabel:UILabel = {
            let returnSignUpViewLabel = UILabel()
            returnSignUpViewLabel.text = "Welcome to Club Sunrise Coast..."
            returnSignUpViewLabel.font = UIFont.boldSystemFont(ofSize: 30)
            returnSignUpViewLabel.textColor = UIColor.orange
            returnSignUpViewLabel.backgroundColor = UIColor.init(red: 66/255, green: 66/255, blue: 66/255, alpha: 100/100)
            returnSignUpViewLabel.adjustsFontSizeToFitWidth = true
            return returnSignUpViewLabel
        }()

//add作業
        addSubview(imageView)
        addSubview(userNameTextField)
        addSubview(mailAddressTextField)
        addSubview(passwordTextField)
        addSubview(signUpViewLabel)
        addSubview(loginImageView)
        addSubview(loginButton)
        
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        mailAddressTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signUpViewLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        loginImageView.translatesAutoresizingMaskIntoConstraints = false
//レイアウト

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
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -UIScreen.main.bounds.height/8).isActive = true

        //ラベル
        signUpViewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        signUpViewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        signUpViewLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        signUpViewLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        

        
    }
    
    
}


