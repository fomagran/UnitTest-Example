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
    var mcokSignUpViewDelegate:MockSignUpViewDelegate!
    var sut:SignUpPresenter!
    
    
    override func setUp() {
        signUpModel = SignUpModel(firstName:"Foma",lastName:"gran",email:"fomagran6@naver.com",password:"12345678",repeatPassword:"12345678")
        mockSignUpModelValidator = MockSignUpModelValidator()
        mockSignUpWebService = MockSignUpWebService()
        mcokSignUpViewDelegate = MockSignUpViewDelegate()
        sut = SignUpPresenter(validator:mockSignUpModelValidator,webservice: mockSignUpWebService,delegate:mcokSignUpViewDelegate)
    }
    
    override func tearDown() {
        signUpModel = nil
        mockSignUpModelValidator = nil
        mockSignUpWebService = nil
        mcokSignUpViewDelegate = nil
        sut = nil
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
    
    func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate() {
        
        let expectation = expectation(description: "Expected the successfulSignUp() method to be called")
        
        mcokSignUpViewDelegate.expectation = expectation
        
        sut.processUserSignUp(model: signUpModel)
        
        self.wait(for: [expectation], timeout: 5)
        
        XCTAssertEqual(mcokSignUpViewDelegate.successfulSignUpCounter, 1,"The successfulSignUpCounter() method was called more than one time ")
    }
    
    func testSignupPresenter_WhenSignupOperationFail_ShouldCallErrorOnDelegate() {
        
        let errorExpectation = expectation(description: "Expected the errorHandler() method to be called")
        
        mcokSignUpViewDelegate.expectation = errorExpectation
        mockSignUpWebService.shouldReturnError = true
        
        sut.processUserSignUp(model: signUpModel)
        
        self.wait(for: [errorExpectation], timeout: 5)
        
        XCTAssertEqual(mcokSignUpViewDelegate.successfulSignUpCounter, 0)
        XCTAssertEqual(mcokSignUpViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mcokSignUpViewDelegate.signUpError)
        
    }
    
}
