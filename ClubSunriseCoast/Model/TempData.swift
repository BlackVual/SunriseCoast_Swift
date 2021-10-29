//
//  TempData.swift
//  ClubSunriseCoast
//
//  Created by KOJIRO MARUYAMA on 2021/10/26.
//

import Foundation

struct profileTempData {
    let lastname: String
    let firstname: String
    let dataOfBirth: String
    let mailAddress:String

    init(Lastname:String,Firstname:String,DataOfBirth:String,MailAddress:String) {
        lastname = Lastname
        firstname = Firstname
        dataOfBirth = DataOfBirth
        mailAddress = MailAddress
    }
}
