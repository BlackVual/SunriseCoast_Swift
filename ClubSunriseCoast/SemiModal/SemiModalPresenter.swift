//
//  SemiModalPresenter.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/06.
//

import Foundation
import UIKit

public protocol SemimodalPresenterDelegate:AnyObject{
    ///ViewControllerからモーダルの高さを決定するのに使用
//    var semimodalContetsHeight: CGFloat{get}
    func ObjectHeightGet(presentingControllerArg:UIViewController) -> CGFloat
}

class SemiModalPresenter: NSObject{
    
    //presentするViewControllerを設定する(Publicにしないとこのプロパティに外部クラスから代入できなくなる。)
    public weak var viewController: UIViewController? {
        didSet{
            if let viewController = viewController {
                viewController.modalPresentationStyle = .custom
                viewController.transitioningDelegate = self
                dismissInteractiveTransition.viewController = viewController
                dismissInteractiveTransition.addPanGesture(to: [viewController.view,indicator,overLayView])
            }
        }
    }
    
    ///オーバーレイ
    private lazy var overLayView: SemiModalOverlayView = {
        let overLayView = SemiModalOverlayView()
        overLayView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(overLayDidtap(_:))))
        return overLayView
    }()
    
    //モーダル上部に表示されるインジケータ(なぜLazyにしているのかは不明)
    private lazy var indicator:SemiModalIndicatorView = {
        let indicator = SemiModalIndicatorView()
        indicator.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(indicatorDidTap(_:))))
        return indicator
    }()
    
    //インタラクティブなDismiss Transidtion
    private let dismissInteractiveTransition = semiModalDismissInteractiveTransition()
}

extension SemiModalPresenter {
    
    ///オーバーレイタップ
    @objc private func overLayDidtap(_ sender: AnyObject){
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    ///インジケータタップ
    /// -paramater sender:
    @objc private func indicatorDidTap(_ sender: AnyObject) {
        viewController?.dismiss(animated: true, completion: nil)
    }
}

extension SemiModalPresenter:UIViewControllerTransitioningDelegate{
    
    /// 画面遷移開始時に呼ばれる。カスタムビューを使用して表示する。
    /// - Parameters:
    ///   - presented: 呼び出し先ViewController
    ///   - presenting: 呼び出し元ViewController
    ///   - source: presentメソッドがプレゼンテーションプロセスを開始するために呼び出されたViewController
    /// - Returns: UIPresentationController
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SemiModalPresentationController(presentedViewControlller: presented, presenting: presenting, ovarlayView: overLayView, indicator: indicator)
           
    }
    
    //dissmiss時に呼ばれる。Dismissのアニメーション指定
    /// - Parameter dismissed: dismissされるViewController
    /// - Returns: UIViewControllerAnimatedTransitioning
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SemiModalDismissAnimatedTransition()
    }
    
    /// インタラクティブなdismissを制御する。
    /// - Parameter animator: animationController(forDismissed:)で指定したアニメーター
    /// - Returns: UIViewControllerInteractiveTransitioning
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard dismissInteractiveTransition.isInteractiveDismalTransition else {
            return nil
        }
        return dismissInteractiveTransition
    }
    
}


