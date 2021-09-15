//
//  SemiModalDismissAnimatedTransition.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/07.
//

import Foundation
import UIKit

class SemiModalDismissAnimatedTransition:NSObject {
    
}
extension SemiModalDismissAnimatedTransition:UIViewControllerAnimatedTransitioning{
    /// transitionの時間
    /// - Parameter transitionContext:
    /// - Returns:
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    /// アニメーションtransition
    /// - Parameter transitionContext:
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
                        guard let fromView = transitionContext.view(forKey: .from) else{
                            return
                        }
                        //Viewを下にスライドさせる
                        fromView.center.y = UIScreen.main.bounds.size.height + fromView.bounds.height / 2
                       },
                       completion:{ _ in
                        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                       }
        )
    }
}
