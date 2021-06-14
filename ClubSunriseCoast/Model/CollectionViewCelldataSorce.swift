//
//  CollectionViewCelldataSorce.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/06/03.
//

import Foundation

class CollectionViewCelldataSorce{
    var datas = CollectionViewCellData()
    
    func count() -> Int{
        print("データ構造の数は\(datas.imageArray.count)")
        return datas.imageArray.count
    }
    
}
