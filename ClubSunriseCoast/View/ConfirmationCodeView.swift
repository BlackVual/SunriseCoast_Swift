//
//  ConfirmationCode.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/10/15.
//✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨
//
//本来この画面ではメールリンク（メールアドレスにリンクが載っていてそこで認証させる）方法を取りたいが
//開発者のデベロッパアカウントがないと実装できないらしいので一旦割愛して開発する10/18〜
//
//✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨
import Foundation
import UIKit

class  ConfirmationCodeView:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
//        autoLayoutSetUp()
//        autoLayout()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
