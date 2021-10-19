//
//  User.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/10/18.
//

import Foundation
import Firebase

struct AppUser {
    let userID: String
//    let userName: String

    init(data: [String: Any]) {
        userID = data["userID"] as! String
//        userName = data["userName"] as! String
    }
}
