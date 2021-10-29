//
//  profileData.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/10/19.
//

import Foundation
import Firebase

struct profileData {
    let lastname: String
    let firstname: String
    let dataOfBirth: String
    let senderID: String
    let createdAt: Timestamp
    let updatedAt: Timestamp

    init(data: [String: Any]) {
        lastname = data["lastname"] as! String
        firstname = data["firstname"] as! String
        dataOfBirth = data["dataOfBirth"] as! String
        senderID = data["senderID"] as! String
        createdAt = data["createdAt"] as! Timestamp
        updatedAt = data["updatedAt"] as! Timestamp
    }
}
