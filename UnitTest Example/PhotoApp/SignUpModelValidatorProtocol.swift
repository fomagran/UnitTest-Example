//
//  SignUpModelValidatorProtocol.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/09.
//

import Foundation

protocol SignUpModelValidatorProtocol {
    
    func isFirstNameValid(firstName:String)
    
    func isValidPassword(password:String)
    
    func doPasswordsMatch(password:String,repeatPassword:String)
    
}
