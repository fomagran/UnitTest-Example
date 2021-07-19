//
//  MockSignupPresenter.swift
//  UnitTest ExampleTests
//
//  Created by Fomagran on 2021/07/19.
//

import Foundation
@testable import UnitTest_Example

class MockSignupPresenter:SignupPresenterProtocol {
    var processUserSignupCalled:Bool = false
    
    required init(validator: SignUpModelValidatorProtocol, webservice: SignUpWebServiceProtocol, delegate: SignUpViewDelegateProtocol) {
        //TODO:
    }
    
    func processUserSignUp(model: SignUpModel) {
        processUserSignupCalled = true
    }
}
