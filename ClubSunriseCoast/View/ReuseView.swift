//
//  ReuseView.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/10/27.
//

import Foundation
import UIKit

protocol reuseViewProtcol:AnyObject{
    func reuseViewSetUp(reuseview:reuseView)
}
class reuseView:UIView{
    
    weak var delegate:reuseViewProtcol?
        
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    //オブジェクト同士の中間の距離を取りたい時に上にある方のオブジェクトのminYをtopobjectMinY
    //下にある方のオブジェクトのmaxYの値を代入すると中間に線を引いてくれる
    //例:dateOfBirthTextField.frame.minY mailAddressTextField.frame.maxY
    var topobjectMinY:CGFloat = 0.0
    var buttomObjectMaxY:CGFloat = 0.0
    var red:CGFloat = 0.0
    var green:CGFloat = 0.0
    var blue:CGFloat = 0.0
    var alphaValue:CGFloat = 0.0
    var lineWidth:CGFloat = 0.0

    
    override func draw(_ rect: CGRect) {
        
        let centerValue = UIBezierFormula()
        let YValue = centerValue.centerYaxisGet(topObjecMinY: self.topobjectMinY, buttomObjecMaxY: self.buttomObjectMaxY)
        
        
        // テキストフィールド間の直線 -------------------------------------
        // UIBezierPath のインスタンス生成
        let line = UIBezierPath();
        // 起点
        line.move(to: CGPoint(x: self.frame.minX, y: YValue));
        // 帰着点
        line.addLine(to: CGPoint(x: self.frame.maxX, y:YValue));
        // ラインを結ぶ
        line.close()
        // 色の設定
        UIColor.init(red: self.red/255, green: self.green/255, blue: self.blue/255, alpha: self.alphaValue/100).setStroke()
        // ライン幅
        line.lineWidth = self.lineWidth
        // 描画
        line.stroke();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension reuseView{
    func Setup(){
        delegate?.reuseViewSetUp(reuseview: self)
    }
}
