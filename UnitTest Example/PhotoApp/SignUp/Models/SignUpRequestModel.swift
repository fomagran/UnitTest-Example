//
//  SignUpRequestModel.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/08.
//

import Foundation

struct SignUpRequestModel:Encodable {
    
    let firstName:String
    let lastName:String
    let email:String
    let password:String
}
