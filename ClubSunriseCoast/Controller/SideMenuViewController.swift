//
//  SideMenuViewController.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/03/14.
//

import UIKit

//--Protocol
protocol sidemenuViewControllerDelegate:AnyObject{
    func parentViewControllerForsidemenuViewController(_ sidemenuViewController:SideMenuViewController) -> UIViewController
    func shouldPresentForsideMenuViewController(_sidemenuViewController:SideMenuViewController) -> Bool
    func sidemenuViewControllerDidRequestShowing(_sidemenuViewController:SideMenuViewController, contentAvailability:Bool,animated:Bool)
    func sidemenuViewControllerDidRequesthiding(_sidemenuViewcontroller:SideMenuViewController,animated:Bool)
    func sidemenuViewcontroller(_ sidemenuViewcontroller:SideMenuViewController,didselectItemAt indexPath:IndexPath)
}



class SideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    
    private let contentView = UIView(frame: .zero)
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var screenEdgePanGestureRecognizer: UIScreenEdgePanGestureRecognizer!
    private var panGestureRecognizer: UIPanGestureRecognizer!
    private var beganlocattion:CGPoint = .zero
    private var beganstate:Bool = false
    
    var isShown: Bool {
        return self.parent != nil
    }
    
    weak var delegate:sidemenuViewControllerDelegate?
    
    private var contentMaxWidth: CGFloat {
        return view.bounds.width * 0.6
    }
    
    var contentRatio: CGFloat {
        get {
            return contentView.frame.maxX / contentMaxWidth
        }
        set {
            let ratio = min(max(newValue, 0), 1)
            contentView.frame.origin.x = contentMaxWidth * ratio - contentView.frame.width
            contentView.layer.shadowColor = UIColor.black.cgColor
            contentView.layer.shadowRadius = 3.0
            contentView.layer.shadowOpacity = 0.8

            view.backgroundColor = UIColor(white: 0, alpha: 0.3 * ratio)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var contentRect = view.bounds
        contentRect.size.width = contentMaxWidth
        contentRect.origin.x = -contentRect.width
        contentView.frame = contentRect
        contentView.backgroundColor = .white
        contentView.autoresizingMask = .flexibleHeight
        view.addSubview(contentView)
    
        tableView.frame = contentView.bounds
        tableView.separatorInset = .zero
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Default")
        contentView.addSubview(tableView)
        tableView.reloadData()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped(sender:)))
        tapGestureRecognizer.delegate = self
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func backgroundTapped(sender: UITapGestureRecognizer) {
        hideContentsView(animeted: true){ (_) in
            self.willMove(toParent: nil)
            self.removeFromParent()
            self.view.removeFromSuperview()
        }
    }
    
    
    func showContentView(animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.3,animations:{
                self.contentRatio = 1.0
            })
        } else {
            contentRatio = 1.0
        }
    }
    
    func hideContentsView(animeted:Bool,completion:( (Bool) -> Swift.Void)?) {
        if animeted{
            UIView.animate(withDuration: 0.2, animations:{ self.contentRatio = 0}
            ,completion: {(finished) in completion?(finished)}
            )
        } else {
            contentRatio = 0
            completion?(true)
        }
    }
    
    func startPangestureRecognizing() -> Void{
        if let parantViewController = self.delegate?.parentViewControllerForsidemenuViewController(self){
            screenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(panGestureRecognizerHandled(panGestureRecognizer:)))
            screenEdgePanGestureRecognizer.edges = [.left]
            screenEdgePanGestureRecognizer.delegate = self
            parantViewController.view.addGestureRecognizer(screenEdgePanGestureRecognizer)

            panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerHandled(panGestureRecognizer:)))
            panGestureRecognizer.delegate = self
            parantViewController.view.addGestureRecognizer(panGestureRecognizer)
        }
    }
    
    @objc private func panGestureRecognizerHandled(panGestureRecognizer: UIPanGestureRecognizer) {
        guard let shouldPresent = self.delegate?.shouldPresentForsideMenuViewController(_sidemenuViewController: self), shouldPresent else {
            return
        }
        
        let translation = panGestureRecognizer.translation(in: view)
        if translation.x > 0 && contentRatio == 1.0 {
            return
        }
        
        let location = panGestureRecognizer.location(in: view)
        switch panGestureRecognizer.state {
        case .began:
            beganstate = isShown
            beganlocattion = location
            if translation.x  >= 0 {
                self.delegate?.sidemenuViewControllerDidRequestShowing(_sidemenuViewController: self, contentAvailability: false, animated: false)
            }
        case .changed:
            let distance = beganstate ? beganlocattion.x - location.x : location.x - beganlocattion.x
            if distance >= 0 {
                let ratio = distance / (beganstate ? beganlocattion.x : (view.bounds.width - beganlocattion.x))
                let contentRatio = beganstate ? 1 - ratio : ratio
                self.contentRatio = contentRatio
            }
            
        case .ended, .cancelled, .failed:
            if contentRatio <= 1.0, contentRatio >= 0 {
                if location.x > beganlocattion.x {
                    showContentView(animated: true)
                } else {
                    self.delegate?.sidemenuViewControllerDidRequesthiding(_sidemenuViewcontroller: self, animated: true)
                }
            }
            beganlocattion  = .zero
            beganstate = false
        default: break
        }
    }
    

}


extension SideMenuViewController{
    internal func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let location = gestureRecognizer.location(in: tableView)
        if tableView.indexPathForRow(at: location) != nil {
            return false
        }
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath)
        if indexPath.row == 0{
            cell.textLabel?.text = "MyPage"
            
        } else {
            cell.textLabel?.text = "Item \(indexPath.row)"
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.sidemenuViewcontroller(self, didselectItemAt: indexPath)
        let signInVC = SignInViewController()

        if indexPath.row == 0{
            navigationController?.pushViewController(signInVC, animated: true)
            
        } else if indexPath.row == 1{
            return
        } else {
            print("まだその項目は未製造です。")
        }
        
    }
}
