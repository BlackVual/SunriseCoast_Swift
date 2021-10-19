//
//  SignUp.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/04/06.
//

import Foundation
import UIKit
class SignInViewController:UIViewController{

    //インスタンス化（Model）
    let signInViewData = SignInViewData()

    //インスタンス化（View）
    let signInView = SignInView()

    //インスタンス化（Controller）
    let semiModalPresenter = SemiModalPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegate適用
        signInView.delegate = self
        
        //SetUp
        //背景画像セット
        imageSetUp()
        //Viewの追加
        viewSetup()
    }
    
}

extension SignInViewController:signInViewDelegate,UIViewControllerTransitioningDelegate {
    
    //デリゲート処理(遷移)
    func viewtransiton(singUpButtontapped view: SignInView) {
        let viewController = SignUpViewController()
        semiModalPresenter.viewController = viewController
        present(viewController, animated: true)
    }
    
    //SetUp
    func viewSetup() {
        self.view = signInView
    }
    //SetUp
    func imageSetUp() {
        signInView.imageView.image = signInViewData.image
        signInView.loginImageView.image = signInViewData.loginImage
    }
    
}
