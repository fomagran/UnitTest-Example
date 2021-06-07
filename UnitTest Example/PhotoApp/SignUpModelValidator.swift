//
//  SignUpModelValidator.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/07.
//

import Foundation

class SignUpModelValidator {
    
    func isFirstNameValid(firstName:String) -> Bool {

        return SignUpConstants.firstNameMinLength...SignUpConstants.firstNameMaxLength ~= firstName.count ? true : false
    }
    
}
