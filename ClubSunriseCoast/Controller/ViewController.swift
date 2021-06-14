//
//  ViewController.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/03/14.
//

import UIKit

class ViewController: UIViewController,sidemenuViewControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //-------■CollectionView--------------
//        Collection viewのレイアウト情報変数
        flowLayout.itemSize = CGSize(
            width: self.view.frame.width,
            height: self.view.frame.width
        )
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//      Collection viewに適用
        collectionView = UICollectionView(
            frame: self.view.frame ,
            collectionViewLayout:flowLayout
        )
//        Collection viewのデリゲート反映
        collectionView.delegate = self
        collectionView.dataSource = self
//        Collection viewのCell情報紐付け
        collectionView.register(UICollectionViewcell.self, forCellWithReuseIdentifier: "CustomCell")
//      自身のViewにCollection viewをADD
        self.view.addSubview(collectionView)
        
        //-------■Side Menu-------------------
//        サイドメニューコントローラーのデリゲートを自身に反映
        sidemenuViewController.delegate = self
//       サイドメニューコントローラーのPangesture関数を開始
        sidemenuViewController.startPangestureRecognizing()
        
    }
    //-------■CollectionView--------------
//    collectionViewインスタンス変数
    var collectionView: UICollectionView!
//    レイアウト情報格納変数
    let flowLayout = UICollectionViewFlowLayout()
//    Collection view Cellをインスタンス化
    var uicollectionViewcell = UICollectionViewcell()
//    uiviewをインスタンス化
    var uiview:UIviewAnimation!
//    Collection viewのデータソースクラスをインスタンス化
    var collectionViewcelldatasorce = CollectionViewCelldataSorce()
//    Collection viewのデータ格納クラスをインスタンス化
    var collectiondata = CollectionViewCellData()

    //-------■Side Menu--------------
//    サイドメニューコントローラーをインスタンス化
    let sidemenuViewController = SideMenuViewController()
//    コンテンツビューをインスタンス化
    let contentViewController = UINavigationController(rootViewController: UIViewController())
//    サイドメニューの表示有無格納変数
        private var isShownSidemenu: Bool {
            return sidemenuViewController.parent == self
        }

//    メニューボタンが押された際の挙動
    @IBAction func MenuButtonPusshed(_ sender: Any) {
        if sidemenuViewController.contentRatio == 0{
            showsidemenu(animated: true)
        } else {
            hideSidemenu(animated: true)
        }
    }
    
//    サイドメニュー表示関数
    private func showsidemenu(contentAvailavility:Bool = true,animated: Bool) {
        if isShownSidemenu { return }
        
        addChild(sidemenuViewController)
        sidemenuViewController.view.autoresizingMask = .flexibleHeight
        sidemenuViewController.view.frame = contentViewController.view.bounds
        //        Viewの重なり順を変更している
        view.insertSubview(sidemenuViewController.view, aboveSubview: contentViewController.view)
        //        サイドメニューがこのビューコントローラーに追加されたことを通知する（ライフサイクルイベントが使えるようにするため）
        sidemenuViewController.didMove(toParent: self)
        if contentAvailavility{
            sidemenuViewController.showContentView(animated: animated)
        }
    }
//    サイドメニュー非表示関数
    private func hideSidemenu(animated: Bool) {
        if !isShownSidemenu { return }

        sidemenuViewController.hideContentsView(animeted: animated,completion: { (_) in
            self.sidemenuViewController.willMove(toParent: nil)
            self.sidemenuViewController.removeFromParent()
            self.sidemenuViewController.view.removeFromSuperview()
        })
    }
}

extension ViewController{
    //-------■Side Menu-------------------
    func parentViewControllerForsidemenuViewController(_ sidemenuViewController: SideMenuViewController) -> UIViewController {
        return self
    }
    
    func shouldPresentForsideMenuViewController(_sidemenuViewController: SideMenuViewController) -> Bool {
        return true
    }
    
    func sidemenuViewControllerDidRequestShowing(_sidemenuViewController: SideMenuViewController, contentAvailability: Bool, animated: Bool) {
        showsidemenu(contentAvailavility: contentAvailability,animated: animated)
    }
    
    func sidemenuViewControllerDidRequesthiding(_sidemenuViewcontroller: SideMenuViewController, animated: Bool) {
        hideSidemenu(animated: animated)
    }
    
    func sidemenuViewcontroller(_ sidemenuViewcontroller: SideMenuViewController, didselectItemAt indexPath: IndexPath) {
        return
    }
    //-------■CollectionView--------------
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("セル表示の直前です")
        uiview.delegete?.uIAnimation()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewcelldatasorce.count()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! UICollectionViewcell

        let celldata = collectiondata
        cell.imgViewheight = flowLayout.itemSize.height
        cell.imgViewwidth = flowLayout.itemSize.width
        cell.image = celldata.imageArray[indexPath.row]
        cell.backgroundColor = .white
        uiview = UIviewAnimation(frame: cell.imgViewrect)
        cell.contentView.addSubview(uiview)
        cell.imgViewsetup(image: cell.image)
        uiview.addSubview(cell.uiimageview)

        return cell
    }
}

