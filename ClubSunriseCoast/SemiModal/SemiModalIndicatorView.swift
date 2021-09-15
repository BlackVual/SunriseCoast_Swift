//
//  SemiModalIndicatorView.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/07.
//

import Foundation
import UIKit
class SemiModalIndicatorView:UIView{
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
}

extension SemiModalIndicatorView {
    private func setup() {
        layer.masksToBounds = true
        layer.cornerRadius = 0.5
        backgroundColor = UIColor.lightGray
    }
}
