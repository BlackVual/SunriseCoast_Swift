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

        setButtonFeild()
    }
    
    func setButtonFeild() {
//ボタン・フィールド定義
        let signUpButton:UIButton = {
            let returnUIButton = UIButton()
    //コードレイアウト用の定義
            returnUIButton.translatesAutoresizingMaskIntoConstraints = false
    //デザイン
            returnUIButton.layer.borderColor = UIColor.blue.cgColor
            returnUIButton.backgroundColor = .white
            returnUIButton.setTitle("Sign Up", for: .normal)
    //これは遷移関数を実装した後に追記
//            returnUIButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
            return returnUIButton
        }()
        
        var signInButton:UIButton!
        var userNameTextField:UITextField!
        var mailAddressTextField:UITextField!

//add作業
        addSubview(signUpButton)

//レイアウト
        signUpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        signUpButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true
        signUpButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.03125).isActive = true
        
        
    }
    
}


