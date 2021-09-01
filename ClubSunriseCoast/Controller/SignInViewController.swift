//
//  SignUp.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/04/06.
//

import Foundation
import UIKit
class SignInViewController:UIViewController{

//インスタンス化（View）
    var signInView = SignInView()
//インスタンス化（Model）
    var signInViewData = SignInViewData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        imageSetUp()
        viewSetup()
    }
    
    func viewSetup() {
        self.view = signInView
    }
    
    func imageSetUp() {
        signInView.imageView.image = signInViewData.image
        signInView.loginImageView.image = signInViewData.loginImage
    }
    
    
}

extension SignInViewController:signInViewDelegate {
    func viewtransiton(singUpButtontapped view: SignInView) {
    }
}
