//
//  SignUpView.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/04/13.
//

import UIKit
protocol signInViewDelegate:AnyObject {
    func viewtransiton(singUpButtontapped view:SignInView)
}

class  SignInView:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayoutSetUp()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//変数宣言
    weak var delegate:signInViewDelegate?

//ボタン・フィールド定義
        
    //ログインボタン
    let loginButton:UIButton = {
        let returnUIButton = UIButton()
        returnUIButton.translatesAutoresizingMaskIntoConstraints = false
        returnUIButton.backgroundColor = .clear
        returnUIButton.layer.cornerRadius = 10.0
        returnUIButton.setTitle("Login　　　", for: .normal)
        returnUIButton.setTitleColor(UIColor.black, for: .normal)
        return returnUIButton
    }()
    //背景イメージビューとログインアイコンイメージビュー
    let imageView:UIImageView = {
        let returnImageView = UIImageView()
        return returnImageView
    }()
    let loginImageView:UIImageView = {
        let returnImageView = UIImageView()
        return returnImageView
    }()
    //パスワード入力テキストフィールド
    let passwordTextField:UITextField = {
        let returnTextField = UITextField()
        returnTextField.borderStyle = .roundedRect
        returnTextField.placeholder = "パスワード"
        return returnTextField
    }()
    //ユーザー名テキストフィールド
    let userNameTextField:UITextField! = {
        let returnUserNameTextField = UITextField()
        returnUserNameTextField.borderStyle = .roundedRect
        returnUserNameTextField.placeholder = "ユーザー名"
        return returnUserNameTextField
    }()
    //タイトルラベル1
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
    //タイトルラベル2
    let signUpTitleLabel2:UILabel = {
        let returnLabel = UILabel()
        returnLabel.text = "Sunrise Coastの全てをマネージメント"
        returnLabel.textColor = .white
        returnLabel.backgroundColor = .clear
        returnLabel.textAlignment = NSTextAlignment.center
        returnLabel.font = UIFont.boldSystemFont(ofSize: returnLabel.font.pointSize)
        returnLabel.adjustsFontSizeToFitWidth = true
        return returnLabel
    }()
    //サインアップガイドラベル
    let signUpGuideLabel:UILabel = {
        let returnLabel = UILabel()
        returnLabel.text = "-----または招待を受け取りSRCメンバーに加入-----"
        returnLabel.textColor = .white
        returnLabel.backgroundColor = .clear
        returnLabel.textAlignment = NSTextAlignment.center
        returnLabel.font = UIFont.boldSystemFont(ofSize: returnLabel.font.pointSize)
        returnLabel.adjustsFontSizeToFitWidth = true
        return returnLabel
    }()
    //サインアップボタン
    let signUpButton:UIButton! = {
        let returnUIButton = UIButton()
        returnUIButton.setTitle("SignUp", for: .normal)
        returnUIButton.titleLabel?.font = UIFont.boldSystemFont(ofSize:returnUIButton.titleLabel?.font.pointSize ?? 100)
        returnUIButton.backgroundColor = UIColor.init(red: 193/255, green: 236/255, blue: 255/255, alpha: 100/100)
        returnUIButton.titleLabel?.adjustsFontSizeToFitWidth = true
        returnUIButton.addTarget(self, action: #selector(singUpButtontapped), for: .touchUpInside)
        return returnUIButton
    }()
    
    @objc func singUpButtontapped(){
        delegate?.viewtransiton(singUpButtontapped: self)
    }
    
    func autoLayoutSetUp() {
        //各オブジェクトをViewに追加
        addSubview(imageView)
        addSubview(userNameTextField)
        addSubview(passwordTextField)
        addSubview(loginImageView)
        addSubview(loginButton)
        addSubview(signUpTitleLabel1)
        addSubview(signUpTitleLabel2)
        addSubview(signUpGuideLabel)
        addSubview(signUpButton)
        //UIオートレイアウトと競合させない処理
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        loginImageView.translatesAutoresizingMaskIntoConstraints = false
        signUpTitleLabel1.translatesAutoresizingMaskIntoConstraints = false
        signUpTitleLabel2.translatesAutoresizingMaskIntoConstraints = false
        signUpGuideLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func autoLayout() {
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


