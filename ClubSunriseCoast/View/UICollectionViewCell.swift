//
//  UICollectionViewCell.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/06/03.
//

import Foundation
import UIKit

class UICollectionViewcell:UICollectionViewCell{
  
//    var textfield:UITextField!
    var imgViewwidth:CGFloat!
    var imgViewheight:CGFloat!
    var imgViewrect: CGRect!
//    var uiView:UIviewAnimation!
    var uiimageview:UIImageView = {
        var returnUIimageView = UIImageView()
        
        return returnUIimageView
    }()

    
    var image:UIImage! {
        didSet{
            imgViewrect = CGRect(x: 0, y: 0, width: imgViewwidth, height: imgViewheight)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    
    func imgViewsetup(image:UIImage) {
        
        uiimageview.frame = imgViewrect
        uiimageview.image = image
        
    }
    
}
