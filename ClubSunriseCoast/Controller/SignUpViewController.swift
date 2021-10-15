//
//  SignUpViewController.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/01.
//

import Foundation
import UIKit

class SignUpViewController:UIViewController{
    
    //インスタンス化（Model）
    let signUpData = SignUpViewData()
    //インスタンス化（View）
    let signUpView = SignUpview()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delegate処理
        signUpView.delegate = self
        //Viewの追加
        viewSetup()
        //背景画像セット
        imageSetUp()
    }
    
}

extension SignUpViewController: SemimodalPresenterDelegate,signUpViewDelegate {
    func viewtransiton(nextViewButtontapped view: SignUpview) {
        let viewController = ConfirmationCodeViewController()
        present(viewController, animated: true)
    }
    
    func ObjectHeightGet(presentingControllerArg: UIViewController) -> CGFloat {
        return presentingControllerArg.view.bounds.height * 0.9
    }
    
    //SetUp
    func viewSetup() {
        self.view = signUpView
    }
    
    //SetUp
    func imageSetUp() {
        signUpView.imageView.image = signUpData.image
    }

    
}
