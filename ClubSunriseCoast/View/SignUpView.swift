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
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        self.backgroundColor = .white
        setButtonFeild()
    }
    
    func setButtonFeild() {
//ボタン・フィールド定義
        
        //イメージビュー
        let imageView
        
        //新規登録ボタン
        let loginButton:UIButton = {
            let returnUIButton = UIButton()
            returnUIButton.translatesAutoresizingMaskIntoConstraints = false
            returnUIButton.layer.borderColor = UIColor.blue.cgColor
            returnUIButton.backgroundColor = .blue
            returnUIButton.layer.cornerRadius = 10.0
            returnUIButton.setTitle("Login", for: .normal)
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

//add作業
        addSubview(loginButton)
        addSubview(userNameTextField)
        addSubview(mailAddressTextField)
        addSubview(passwordTextField)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        mailAddressTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

//レイアウト

        //ユーザー名のテキストフィールド
        userNameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75).isActive = true
        userNameTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.03125).isActive = true
        userNameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 300).isActive = true
        userNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        //ユーザー名のテキストフィールド
        passwordTextField.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 5).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor).isActive = true
        //ユーザー名のテキストフィールド
        loginButton.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor, multiplier: 0.25).isActive = true
        loginButton.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: userNameTextField.trailingAnchor).isActive = true
        

        
    }
    
    
}


