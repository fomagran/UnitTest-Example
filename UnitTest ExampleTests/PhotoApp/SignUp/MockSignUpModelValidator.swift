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
    

    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isValidPassword(password: String)  -> Bool {
        return true
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String)  -> Bool {
        return true
    }
    
}
