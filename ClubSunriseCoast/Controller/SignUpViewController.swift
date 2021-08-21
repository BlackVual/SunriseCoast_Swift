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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewSetup()
    }
    
    func viewSetup() {
        self.view = signUpView
    }
    
    
}
