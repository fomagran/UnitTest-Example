//
//  SignUpPresenterTests.swift
//  UnitTest ExampleTests
//
//  Created by Fomagran on 2021/06/09.
//

import XCTest
@testable import UnitTest_Example

class SignUpPresenterTests: XCTestCase {
    
    var signUpModel:SignUpModel!
    var mockSignUpModelValidator:MockSignUpModelValidator!
    var mockSignUpWebService:MockSignUpWebService!
    var sut:SignUpPresenter!
    

    override func setUp() {
         signUpModel = SignUpModel(firstName:"Foma",lastName:"gran",email:"fomagran6@naver.com",password:"12345678",repeatPassword:"12345678")
        
         mockSignUpModelValidator = MockSignUpModelValidator()
        
         mockSignUpWebService = MockSignUpWebService()
        
        sut = SignUpPresenter(validator:mockSignUpModelValidator,webservice: mockSignUpWebService)
    }

    override func tearDown() {
        
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        
        sut.processUserSignUp(model:signUpModel)
        
        XCTAssertTrue(mockSignUpModelValidator.isFirstNameValidated,"FirstName was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isValidPassword,"LastName was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isMatchPassword,"Repeat password did not match")
    }
    
    func testSignupPresenter_WhenGivenValidModel_ShouldCallSignUpMmethod() {
        
        sut.processUserSignUp(model:signUpModel)
        
        XCTAssertTrue(mockSignUpWebService.isSignUpMethodCalled,"The signUp() method was not called in the SignUpWebService class")
    }

}
