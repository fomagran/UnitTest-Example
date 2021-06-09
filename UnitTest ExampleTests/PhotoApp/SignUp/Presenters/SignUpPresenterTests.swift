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
        let mockSignUpWebService = MockSignUpWebService()
        let sut = SignUpPresenter(validator:mockSignUpModelValidator,webservice: mockSignUpWebService)
        
        sut.processUserSignUp(model:signUpModel)
        
        XCTAssertTrue(mockSignUpModelValidator.isFirstNameValidated,"FirstName was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isValidPassword,"LastName was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isMatchPassword,"Repeat password did not match")
    }
    
    func testSignupPresenter_WhenGivenValidModel_ShouldCallSignUpMmethod() {
        let signUpModel = SignUpModel(firstName:"Foma",lastName:"gran",email:"fomagran6@naver.com",password:"12345678",repeatPassword:"12345678")
        
        let mockSignUpModelValidator = MockSignUpModelValidator()
        
        let mockSignUpWebService = MockSignUpWebService()
        
        let sut = SignUpPresenter(validator:mockSignUpModelValidator,webservice:mockSignUpWebService)
        
        sut.processUserSignUp(model:signUpModel)
        
        XCTAssertTrue(mockSignUpWebService.isSignUpMethodCalled,"The signUp() method was not called in the SignUpWebService class")
    }

}
