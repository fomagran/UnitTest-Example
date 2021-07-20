//
//  SignUpModelValidator.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/07.
//

import Foundation

class SignUpModelValidator:SignUpModelValidatorProtocol {

    func isFirstNameValid(firstName:String) throws -> Bool {
        
        if firstName.contains("@") {
            throw SignUpError.illigalCharatersFound
        }

        return SignUpConstants.firstNameMinLength...SignUpConstants.firstNameMaxLength ~= firstName.count ? true : false
    }
    
    func isValidPassword(password:String) -> Bool {
        return password.count >= 8
    }
    
    func doPasswordsMatch(password:String,repeatPassword:String) -> Bool {

        return password == repeatPassword
    }
    
}
