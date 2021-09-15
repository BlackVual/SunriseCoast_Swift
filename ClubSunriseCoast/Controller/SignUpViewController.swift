//
//  SignUpViewController.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/01.
//

import Foundation
import UIKit

class SignUpViewController:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
}

extension SignUpViewController: SemimodalPresenterDelegate {
    var semimodalContetsHeight: CGFloat {
        return 
    }
}
