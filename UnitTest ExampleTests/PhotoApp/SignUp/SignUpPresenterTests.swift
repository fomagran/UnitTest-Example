//
//  SignUpPresenterTests.swift
//  UnitTest ExampleTests
//
//  Created by Fomagran on 2021/06/09.
//

import XCTest
@testable import UnitTest_Example

class SignUpPresenterTests: XCTestCase {
    
    

    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        let signUpModel = SignUpModel(firstName:"Foma",lastName:"gran",email:"fomagran6@naver.com",password:"12345678",repeatPassword:"12345678")
        
        let mockSignUpModelValidator = MockSignUpModelValidator()
        
        let sut = SignUpPresenter(validator:mockSignUpModelValidator)
        
        sut.processUserSignUp(model:signUpModel)
        
        XCTAssertTrue(mockSignUpModelValidator.isFirstNameValidated)
    }

}
