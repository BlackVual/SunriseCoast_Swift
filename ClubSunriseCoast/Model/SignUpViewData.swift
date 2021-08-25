//
//  SignUpViewData.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/08/25.
//

import Foundation
import UIKit

struct SignUpViewData {
    let image:UIImage = {
        var returnImage = UIImage(named: "loginImage")!
        return returnImage
    }()
    
    let loginImage:UIImage = {
        var returnImage = UIImage(named: "loginIcon")!
        return returnImage
    }()
    
}
