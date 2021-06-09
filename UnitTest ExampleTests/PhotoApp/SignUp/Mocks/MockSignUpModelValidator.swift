//
//  MockSignUpModelValidator.swift
//  UnitTest ExampleTests
//
//  Created by Fomagran on 2021/06/09.
//

import Foundation
@testable import UnitTest_Example

class MockSignUpModelValidator:SignUpModelValidatorProtocol {
    
    var isFirstNameValidated:Bool = false
    var isValidPassword:Bool = false
    var isMatchPassword:Bool = false
    

    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isValidPassword(password: String)  -> Bool {
        isValidPassword = true
        return isValidPassword
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String)  -> Bool {
        isMatchPassword = true
        return isMatchPassword
    }
    
}
