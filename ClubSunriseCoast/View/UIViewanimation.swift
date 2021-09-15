//
//  UIViewanimation.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/06/07.
//

import Foundation
import UIKit

protocol AnimationDelegate:AnyObject{
    func uIAnimation()
}

class UIviewAnimation:UIView{
    
    weak var delegete:AnimationDelegate?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegete = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

enum FadeType: TimeInterval {
    case
        Normal = 2.0,
        Slow = 1.0
}

extension UIviewAnimation:AnimationDelegate{
    func uIAnimation() {
        fadeInNormal()
    }
    
    func fadeInNormal(type: FadeType = .Normal, completed: (() -> ())? = nil) {
         fadeIn(duration: type.rawValue, completed: completed)
     }

     /** For typical purpose, use "public func fadeIn(type: FadeType = .Normal, completed: (() -> ())? = nil)" instead of this */
    func fadeIn(duration: TimeInterval = FadeType.Slow.rawValue, completed: (() -> ())? = nil) {
         alpha = 0
        isHidden = false
        UIviewAnimation.animate(withDuration: duration,
             animations: {
                 self.alpha = 1
             }) { finished in
                 completed?()
         }
     }
    func fadeOutJ(type: FadeType = .Normal, completed: (() -> ())? = nil) {
         fadeOut(duration: type.rawValue, completed: completed)
     }
     /** For typical purpose, use "public func fadeOut(type: FadeType = .Normal, completed: (() -> ())? = nil)" instead of this */
    func fadeOut(duration: TimeInterval = FadeType.Slow.rawValue, completed: (() -> ())? = nil) {
        UIviewAnimation.animate(withDuration: duration
             , animations: {
                 self.alpha = 0
             }) { [weak self] finished in
            self?.isHidden = true
                 self?.alpha = 1
                 completed?()
         }
     }
    
}
