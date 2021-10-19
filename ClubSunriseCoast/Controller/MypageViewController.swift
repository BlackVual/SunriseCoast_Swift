//
//  SignUpViewController.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/01.
//

import Foundation
import UIKit
import Firebase

class MypageViewController:UIViewController{
    
    //インスタンス化（Model）

    //インスタンス化（View）
    let MypageView = MypageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SetUp
        //Viewの追加
        viewSetup()
    }
    
}

extension MypageViewController{
    
    //SetUp
//    func viewSetup() {
//        self.view = confirmationCodeView
//    }
    
    func viewSetup(){
        self.view = MypageView
    }
}
