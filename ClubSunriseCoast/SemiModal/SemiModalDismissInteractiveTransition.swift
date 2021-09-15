//
//  SemiModalDismissInteractiveTransition.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/06.
//

import Foundation
import UIKit

class semiModalDismissInteractiveTransition: UIPercentDrivenInteractiveTransition {
    /// 表示しているView Contoroller
    weak var viewController:UIViewController?
    
    ///遷移中かどうか（外部の代入を禁止）
    private(set) var isInteractiveDismalTransition = false
    
    ///完了閾値(0~1.0)
    private let percentCompleteTheresHold:CGFloat = 0.3
    
    ///ジェスチャーの方向
    private var gestureDirection = GestureDirection.down
    
    //Override
    override func cancel() {
        completionSpeed = self.percentCompleteTheresHold
        super.cancel()
    }
    
    override func finish() {
        completionSpeed = 1.0 - percentCompleteTheresHold
        super.finish()
    }
    
}

extension semiModalDismissInteractiveTransition {
    
    ///ジェスチャーの方向
    enum GestureDirection {
        case up
        case down
        
        init(reccgnizer: UIPanGestureRecognizer,View:UIView) {
            ///速度
            let velocity = reccgnizer.velocity(in: View)
            ///三項条件 yが0以上なら up 0未満ならdown
            self = velocity.y <= 0 ? .up : .down
        }
    }
    
    ///PanGestureを付与
    /// - Parameter viewController: 対象のViewController
    func addPanGesture(to views: [UIView]) {
        views.forEach {
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(dismissPanGesture(recognizer:)))
            panGesture.delegate = self
            $0.addGestureRecognizer(panGesture)
        }
    }
    
    /// Panジェスチャー
    /// - Parameter recognizer:
    @objc private func dismissPanGesture(recognizer: UIPanGestureRecognizer) {
        guard let viewcontroller = viewController else {
            return
        }
        ///beganもしくはchengedだった場合はTrueを代入
        isInteractiveDismalTransition = recognizer.state == .began || recognizer.state == .changed
            
        switch recognizer.state {
        case .began:
            gestureDirection = GestureDirection(reccgnizer: recognizer, View: viewcontroller.view)
            if gestureDirection == .down{
                viewcontroller.dismiss(animated: true, completion: nil)
            }
        case .changed:
            //インタラクティブな制御のために、Viewの高さに応じた画面更新を行う
            let transition = recognizer.translation(in: viewcontroller.view)
            var progress = transition.y / viewcontroller.view.bounds.size.height
            switch gestureDirection {
            case .up:
                progress = -max(-1.0, max(-1.0, progress))
            case .down:
                progress = min(1.0, max(0, progress))
            }
                update(progress)
        case .cancelled,.ended:
            if percentComplete > percentCompleteTheresHold {
                finish()
            } else {
                cancel()
            }
        default:
            break
        }
    }
}

extension semiModalDismissInteractiveTransition:UIGestureRecognizerDelegate{
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        //UI ScrollViewの時はPan Gestureとコンフリクトしないようにする。
        if otherGestureRecognizer is UIPanGestureRecognizer && otherGestureRecognizer.view is UIScrollView {
            return true
        } else {
            return false
        }
    }
}
