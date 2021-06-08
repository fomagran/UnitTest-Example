//
//  SignUpRequestModel.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/08.
//

import Foundation

struct SignUpRequestModel {
    
    let firstName:String
    let lastName:String
    let email:String
    let password:String
    
    init(firstName:String,lastName:String,email:String,password:String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
}
