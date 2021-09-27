//
//  SignUpView.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/01.
//

import Foundation
import  UIKit

class SignUpview:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        //デリゲート適用
        dateOfBirthTextField.delegate = self
        
        autoLayoutSetUp()
        autoLayout()
        datapickerSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//ボタン・フィールド定義

    //背景イメージビュー
    let imageView:UIImageView = {
        let returnImageView = UIImageView()
        return returnImageView
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
    
    // 決定ボタン押下
    @objc func done() {
        dateOfBirthTextField.endEditing(true)
        
        // 日付のフォーマット
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateOfBirthTextField.text = "\(formatter.string(from: Date()))"
    }
    
    func autoLayoutSetUp() {
        //各オブジェクトをViewに追加
        addSubview(imageView)
        addSubview(lastNameTextField)
        addSubview(firstNameTextField)
        addSubview(dateOfBirthTextField)

        //UIオートレイアウトと競合させない処理
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirthTextField.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        datapicker.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func autoLayout() {
        
        //背景イメージビュー
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -UIScreen.main.bounds.height/1.4).isActive = true
        
        //姓テキストフィールド
        lastNameTextField.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -10).isActive = true
        lastNameTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        lastNameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.375).isActive = true
        lastNameTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true
        //名テキストフィールド
        firstNameTextField.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10).isActive = true
        firstNameTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        firstNameTextField.widthAnchor.constraint(equalTo: lastNameTextField.widthAnchor).isActive = true
        firstNameTextField.heightAnchor.constraint(equalTo: lastNameTextField.heightAnchor).isActive = true
        //生年月日フィールド
        dateOfBirthTextField.leadingAnchor.constraint(equalTo: lastNameTextField.leadingAnchor).isActive = true
        dateOfBirthTextField.trailingAnchor.constraint(equalTo: firstNameTextField.trailingAnchor).isActive = true
        dateOfBirthTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 30).isActive = true
        dateOfBirthTextField.heightAnchor.constraint(equalTo: lastNameTextField.heightAnchor).isActive = true
        
    }
    
}

extension SignUpview{
    func datapickerSetup() {
        // ピッカー設定
        datapicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        datapicker.timeZone = NSTimeZone.local
        datapicker.locale = Locale.current
//        datapicker.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 500)
        datapicker.preferredDatePickerStyle = .wheels
        
        //ピッカーのツールバーのレイアウト設定
//        toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 35))
        //ツールバーに各セット
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        // インプットビュー設定
//        dateOfBirthTextField.inputView = datapicker
//        dateOfBirthTextField.inputAccessoryView = toolbar
        
    }
}

extension SignUpview:UITextFieldDelegate{
    //テキストフィールドがタップされた際に発火されるデリゲートメソッド
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.addSubview(datapicker)
        self.addSubview(toolbar)
        datapicker.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        datapicker.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        datapicker.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 50).isActive = true
        datapicker.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
//        toolbar.topAnchor.constraint(equalTo: datapicker.topAnchor).isActive = true
//        toolbar.bottomAnchor.constraint(equalTo: datapicker.bottomAnchor, constant: -100).isActive = true
//        toolbar.trailingAnchor.constraint(equalTo: datapicker.trailingAnchor, constant: 50).isActive = true
//        toolbar.leadingAnchor.constraint(equalTo: datapicker.leadingAnchor).isActive = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        datapicker.removeFromSuperview()
        toolbar.removeFromSuperview()
    }
    
}
