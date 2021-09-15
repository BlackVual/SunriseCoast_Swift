//
//  SemiModalOverlayView.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/07.
//

import Foundation
import UIKit

class SemiModalOverlayView: UIView{
    
    var isActive:Bool = false {
        didSet{
            alpha = isActive ? 0.5 : 0.0
        }
    }
    
    required init?(coder aDecoder:NSCoder) {
        super .init(coder: aDecoder)
        setUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
}

extension SemiModalOverlayView{
    
    func setUp() {
        backgroundColor = UIColor.black
        alpha = 0.5
    }
}
