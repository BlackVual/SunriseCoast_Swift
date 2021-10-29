//
//  SignUpView.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/01.
//

import Foundation
import  UIKit
protocol signUpViewDelegate:AnyObject {
    func registerAcount(RegisterAcount view:SignUpview)
}

class SignUpview:UIView,UITextFieldDelegate{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        
        //デリゲートの適用
        lastNameTextField.delegate = self
        firstNameTextField.delegate = self
        mailAddressTextField.delegate = self
        passwordTextField.delegate = self
        passwordConfirmTextField.delegate = self
        uiView.delegate = self
        //レイアウトの前準備
        autoLayoutSetUp()
        //オートレイアウトの設定
        autoLayout()
        //データピッカーの設定
        datapickerSetup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //背景Viewのセットアップ
        uiView.Setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //変数宣言
        weak var delegate:signUpViewDelegate?

//ボタン・フィールド定義

    //背景透過ブラービュー
    let blurEffectView:UIVisualEffectView = {
        let returnUIBlurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: returnUIBlurEffect)
        
        return blurEffectView
    }()
    //タイトルラベル
    let signUpTitleLabel1:UILabel = {
        let returnLabel = UILabel()
        returnLabel.text = "SRC IDを作成"
        returnLabel.textColor = .white
        returnLabel.backgroundColor = .clear
        returnLabel.textAlignment = NSTextAlignment.center
        returnLabel.adjustsFontSizeToFitWidth = true
        return returnLabel
    }()
    //姓テキストフィールド
    let lastNameTextField:UITextField = {
        let returnTextField = UITextField()
        returnTextField.borderStyle = .roundedRect
        returnTextField.placeholder = "姓"
        return returnTextField
    }()
    //名テキストフィールド
    let firstNameTextField:UITextField = {
        let returnTextField = UITextField()
        returnTextField.borderStyle = .roundedRect
        returnTextField.placeholder = "名"
        return returnTextField
    }()
    //生年月日ピッカーと付随するテキストフィールド及び決定バー
    var datapicker:UIDatePicker = UIDatePicker()
    var dateOfBirthTextField:UITextField = {
        let returnTextField = UITextField()
        returnTextField.borderStyle = .roundedRect
        returnTextField.placeholder = "生年月日"
        return returnTextField
    }()
    var toolbar:UIToolbar = UIToolbar()
    let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
    let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
    
    //メールアドレステキストフィールド
    let mailAddressTextField:UITextField = {
        let returnTextField = UITextField()
        returnTextField.borderStyle = .roundedRect
        returnTextField.placeholder = "mail@address.com"
        return returnTextField
    }()
    //パスワードテキストフィールド
    let passwordTextField:UITextField = {
        let returnTextField = UITextField()
        returnTextField.borderStyle = .roundedRect
        returnTextField.placeholder = "パスワード"
        return returnTextField
    }()
    //パスワード再確認テキストフィールド
    let passwordConfirmTextField:UITextField = {
        let returnTextField = UITextField()
        returnTextField.borderStyle = .roundedRect
        returnTextField.placeholder = "パスワード再確認"
        return returnTextField
    }()
    // 決定ボタン押下
    @objc func done() {

        
        // 日付のフォーマット
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        dateOfBirthTextField.text = formatter.string(from: datapicker.date)
        
        dateOfBirthTextField.endEditing(true)
    }
    //次に進むボタン
    let nextViewButton:UIButton = {
        let returnUIButton = UIButton()
        returnUIButton.backgroundColor = UIColor.init(red: 200/255, green: 240/255, blue: 255/255, alpha: 100/100)
        returnUIButton.layer.cornerRadius = 10.0
        returnUIButton.setTitle("次に進む", for: .normal)
        returnUIButton.addTarget(self, action: #selector(nextViewButtontapped), for: .touchUpInside)
        return returnUIButton
    }()
    //次へ進むボタンタップ押下時の挙動
    @objc func nextViewButtontapped(){
        delegate?.registerAcount(RegisterAcount: self)
    }
    //背景View（中身はExtension）
    let uiView = reuseView()
    
    func autoLayoutSetUp() {
        //各オブジェクトをViewに追加
        addSubview(uiView)
        addSubview(blurEffectView)
        addSubview(lastNameTextField)
        addSubview(firstNameTextField)
        addSubview(dateOfBirthTextField)
        addSubview(mailAddressTextField)
        addSubview(passwordTextField)
        addSubview(passwordConfirmTextField)
        addSubview(nextViewButton)
        addSubview(signUpTitleLabel1)


        //UIオートレイアウトと競合させない処理
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirthTextField.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        datapicker.translatesAutoresizingMaskIntoConstraints = false
        mailAddressTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmTextField.translatesAutoresizingMaskIntoConstraints = false
        nextViewButton.translatesAutoresizingMaskIntoConstraints = false
        uiView.translatesAutoresizingMaskIntoConstraints = false
        signUpTitleLabel1.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func autoLayout() {
        
        //背景イメージビュー
        blurEffectView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        blurEffectView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        blurEffectView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -UIScreen.main.bounds.height/1.17).isActive = true
        //姓テキストフィールド
        lastNameTextField.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -10).isActive = true
        lastNameTextField.topAnchor.constraint(equalTo: blurEffectView.bottomAnchor, constant: 20).isActive = true
        lastNameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.375).isActive = true
        lastNameTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true
        //名テキストフィールド
        firstNameTextField.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10).isActive = true
        firstNameTextField.topAnchor.constraint(equalTo: blurEffectView.bottomAnchor, constant: 20).isActive = true
        firstNameTextField.widthAnchor.constraint(equalTo: lastNameTextField.widthAnchor).isActive = true
        firstNameTextField.heightAnchor.constraint(equalTo: lastNameTextField.heightAnchor).isActive = true
        //生年月日フィールド
        dateOfBirthTextField.leadingAnchor.constraint(equalTo: lastNameTextField.leadingAnchor).isActive = true
        dateOfBirthTextField.trailingAnchor.constraint(equalTo: firstNameTextField.trailingAnchor).isActive = true
        dateOfBirthTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 20).isActive = true
        dateOfBirthTextField.heightAnchor.constraint(equalTo: lastNameTextField.heightAnchor).isActive = true
        //メールアドレスフィールド
        mailAddressTextField.leadingAnchor.constraint(equalTo: dateOfBirthTextField.leadingAnchor).isActive = true
        mailAddressTextField.trailingAnchor.constraint(equalTo: dateOfBirthTextField.trailingAnchor).isActive = true
        mailAddressTextField.topAnchor.constraint(equalTo: dateOfBirthTextField.bottomAnchor, constant: 40).isActive = true
        mailAddressTextField.heightAnchor.constraint(equalTo: dateOfBirthTextField.heightAnchor).isActive = true
        //パスワードフィールド
        passwordTextField.leadingAnchor.constraint(equalTo: mailAddressTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: mailAddressTextField.trailingAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: mailAddressTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: mailAddressTextField.heightAnchor).isActive = true
        //パスワード確認フィールド
        passwordConfirmTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        passwordConfirmTextField.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        passwordConfirmTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        passwordConfirmTextField.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor).isActive = true
        //次へ進むボタン
        nextViewButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nextViewButton.topAnchor.constraint(equalTo: passwordConfirmTextField.bottomAnchor, constant: 20).isActive = true
        nextViewButton.heightAnchor.constraint(equalTo: passwordConfirmTextField.heightAnchor).isActive = true
        nextViewButton.widthAnchor.constraint(equalTo: passwordConfirmTextField.widthAnchor, multiplier: 0.5).isActive = true
        //背景View
        uiView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        uiView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        uiView.topAnchor.constraint(equalTo: blurEffectView.bottomAnchor).isActive = true
        uiView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        //タイトルラベル
        signUpTitleLabel1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        signUpTitleLabel1.topAnchor.constraint(equalTo: blurEffectView.topAnchor).isActive = true
        signUpTitleLabel1.widthAnchor.constraint(equalTo: blurEffectView.widthAnchor, multiplier: 0.5).isActive = true
        signUpTitleLabel1.heightAnchor.constraint(equalTo: blurEffectView.heightAnchor).isActive = true

    }
    
}



extension SignUpview{
    func datapickerSetup() {
        // ピッカー設定
        datapicker.datePickerMode = .date
        datapicker.timeZone = NSTimeZone.local
        datapicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale?
        datapicker.preferredDatePickerStyle = .wheels
        
        //ピッカーのツールバーのレイアウト設定
        toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 35))
        //ツールバーに各セット
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        //インプットビュー設定
        dateOfBirthTextField.inputView = datapicker
        dateOfBirthTextField.inputAccessoryView = toolbar
        
    }
}

extension SignUpview{
    
    //リターンボタンを押下したらキーボードがしまわれる処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        lastNameTextField.resignFirstResponder()
        firstNameTextField.resignFirstResponder()
        mailAddressTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        passwordConfirmTextField.resignFirstResponder()
        return true
    }
    //空白の部分をタッチしたらキーボードがしまわれる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
}

extension SignUpview:reuseViewProtcol{
    
    func reuseViewSetUp(reuseview: reuseView) {
        let mailRect = self.convert(mailAddressTextField.frame, to: reuseview)
        let dateOfBirthRect = self.convert(self.dateOfBirthTextField.frame, to: reuseview)

        reuseview.backgroundColor = .white
        reuseview.topobjectMinY = mailRect.minY
        reuseview.buttomObjectMaxY = dateOfBirthRect.maxY
        reuseview.red = 230
        reuseview.green = 230
        reuseview.blue = 230
        reuseview.alphaValue = 100
        reuseview.lineWidth = 2
    
    }
}
