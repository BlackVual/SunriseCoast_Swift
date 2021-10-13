//
//  UIBezierFormula.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/10/13.
//

import Foundation
import UIKit

class UIBezierFormula:UIView{
    
}

extension UIBezierFormula{
    func centerYaxisGet(topObjecMinY:CGFloat,buttomObjecMaxY:CGFloat) -> CGFloat{
        let centerOriginValue = buttomObjecMaxY-topObjecMinY
        let result = centerOriginValue/2+topObjecMinY
        return result
    }
}
