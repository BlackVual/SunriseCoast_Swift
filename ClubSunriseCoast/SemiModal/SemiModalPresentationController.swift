//
//  SemiModalPresentationController.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/09/07.
//

import Foundation
import UIKit

class SemiModalPresentationController: UIPresentationController {
    
    ///表示トランジション終わりのViewのフレーム
    override var frameOfPresentedViewInContainerView: CGRect{
        guard let containerView = containerView else {
            return CGRect.zero
        }
        var presentedViewFrame = CGRect.zero
        let containerBounds = containerView.bounds
        presentedViewFrame.size = self.size(forChildContentContainer: self.presentingViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.origin.x = containerBounds.size.width - presentedViewFrame.size.width
        presentedViewFrame.origin.y = containerBounds.size.height - presentedViewFrame.size.height
        return presentedViewFrame
    }
    ///オーバーレイ
    private let ovarlay:SemiModalOverlayView
    ///インジケーター
    private let indicator:SemiModalIndicatorView
    ///セミモーダルの高さのデフォルト比率
    private let presentedViewControllerHeigtRatio:CGFloat = 0.8

    
    init(presentedViewControlller:UIViewController,presenting presentingViewController:UIViewController?,ovarlayView:SemiModalOverlayView,indicator:SemiModalIndicatorView) {
        self.ovarlay = ovarlayView
        self.indicator = indicator
        super.init(presentedViewController: presentedViewControlller, presenting: presentingViewController)
    }
    
    
    /// 表示されるViewのサイズ(オーバーライドしている関数。コンテナの関数でサイズ決定できる関数を使用している。)
    /// - Parameters:
    ///   - container: コンテナ
    ///   - parentSize: 親Viewのサイズ
    /// - Returns: サイズ
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        ///Delegateで高さが指定されているときはその高さを適用
        if let delegate = presentedViewController as? SemimodalPresenterDelegate{
            return CGSize(width: parentSize.width, height: delegate.ObjectHeightGet(presentingControllerArg: presentingViewController))
        }
        
        ///上記でない場合は標準比率から計算
        return CGSize(width: parentSize.width, height: parentSize.height * self.presentedViewControllerHeigtRatio)
    }
    
    ///SubViewsのレイアウト
    override func containerViewWillLayoutSubviews() {
        guard let containerView = containerView else {
            return
        }
        //overlay
        //containerViewと同じ大きさで、一番上のレイヤーに挿入
        ovarlay.frame = containerView.bounds
        containerView.insertSubview(ovarlay, at: 0)
        
        //presentedView
        //frameの大きさ設定。右上と左上の角を丸くする。
        presentedView?.frame = frameOfPresentedViewInContainerView
        presentedView?.layer.cornerRadius = 10.0
        presentedView?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        //indicator
        //中央上部に配置する
        indicator.frame = CGRect(x: 0, y: 0, width: 60, height: 8)
        presentedViewController.view.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: presentedViewController.view.centerXAnchor),
            indicator.topAnchor.constraint(equalTo: presentedViewController.view.topAnchor, constant: -16),
            indicator.widthAnchor.constraint(equalToConstant: indicator.frame.width),
            indicator.heightAnchor.constraint(equalToConstant: indicator.frame.height)
        ])
    }
    
    /// presentation transition 開始
    override func presentationTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.ovarlay.isActive = true
        }, completion: nil)
    }

    /// dismiss transition 開始
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.ovarlay.isActive = false
        }, completion: nil)
    }

    /// dismiss transition 終了
    /// - Parameter completed:
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            ovarlay.removeFromSuperview()
        }
    }

}
