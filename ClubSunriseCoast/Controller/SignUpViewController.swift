//
//  SignUp.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/04/06.
//

import Foundation
import UIKit
class signUp:UIViewController {

    var signUpView = SignUpView()
    var signUpViewData = SignUpViewData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        imageSetUp()
        viewSetup()
    }
    
    func viewSetup() {
        self.view = signUpView
    }
    
    func imageSetUp() {
        signUpView.imageView.image = signUpViewData.image
        signUpView.loginImageView.image = signUpViewData.loginImage
        
    }
    
    
}
