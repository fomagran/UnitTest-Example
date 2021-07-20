//
//  SignUpModelValidator.swift
//  UnitTest ExampleTests
//
//  Created by Fomagran on 2021/06/07.
//

import XCTest
@testable import UnitTest_Example

class SignUpModelValidatorTests: XCTestCase {
    
    var systemUnderTest:SignUpModelValidator!

    override func setUp() {
        systemUnderTest = SignUpModelValidator()
    }
    
    override func tearDown() {
        systemUnderTest = nil
    }
    
    func testSignUpModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
            
        //Act
        let isFirstNameValid = try! systemUnderTest.isFirstNameValid(firstName:"An")
        
        //Assert
        XCTAssertTrue(isFirstNameValid,"The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignUpModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = try! systemUnderTest.isFirstNameValid(firstName: "a")
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignUpConstants.firstNameMinLength) charaters but it has returned TRUE")
    }
    
    func testSignUpModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = try! systemUnderTest.isFirstNameValid(firstName: "aasdfsdasdfas")
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignUpConstants.firstNameMaxLength) charaters but it has returned TRUE")
    }
    
    func testSignUpModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
            
        //Act
        let isPasswordValid = systemUnderTest.isValidPassword(password: "12345678")
        
        //Assert
        XCTAssertTrue(isPasswordValid,"The isPasswordValid() should have returned TRUE for a valid password but returned FALSE")
    }
    
    func testSignUpModelValidator_WhenEqualPasswordProvided_ShouldReturnTrue() {
        
        let doPasswordsMatch = systemUnderTest.doPasswordsMatch(password: "1234", repeatPassword: "1234")
        XCTAssertTrue(doPasswordsMatch,"The doPasswordsMatch should have returned TRUE for matching password but it has returned FALSE")
    }
    
    func testSignUpModelValidator_WhenNotEqualPasswordProvided_ShouldReturnTrue() {
        
        let doPasswordsMatch = systemUnderTest.doPasswordsMatch(password: "1234", repeatPassword: "12345")
        XCTAssertFalse(doPasswordsMatch,"The doPasswordsMatch should have returned FALSE for matching password but it has returned TRUE")
    }
    
    func testSignUpModelValidator_WhenContatinsIlligalCharacter_ShouldThrowsError() {
        XCTAssertThrowsError(try systemUnderTest.isFirstNameValid(firstName: "a@"),"특수문자가 포함되면 안돼요!") {
            error in
            XCTAssertEqual(error as? SignUpError,SignUpError.illigalCharatersFound)
        }
    }
    
    func testSignUpModelValidator_WhenValidCharaterProvided_ShouldNotThrowsError() {
        XCTAssertNoThrow(try systemUnderTest.isFirstNameValid(firstName: "a"),"제대로 된 성에는 에러를 발생시키면 안돼!")
    }

}
