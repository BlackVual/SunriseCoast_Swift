//
//  SignUpViewController.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/01.
//

import Foundation
import UIKit

class ConfirmationCodeViewController:UIViewController{
    
    //インスタンス化（Model）

    //インスタンス化（View）
    let confirmationCodeView = ConfirmationCodeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SetUp
        //Viewの追加
        
        //背景画像セット
    }
    
}

extension ConfirmationCodeViewController{
    
    //SetUp
//    func viewSetup() {
//        self.view = confirmationCodeView
//    }
    
    func viewSetup(){
        self.view = confirmationCodeView
    }
}
