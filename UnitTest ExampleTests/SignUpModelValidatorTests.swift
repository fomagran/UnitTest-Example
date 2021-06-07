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
        let isFirstNameValid = systemUnderTest.isFirstNameValid(firstName:"An")
        
        //Assert
        XCTAssertTrue(isFirstNameValid,"The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignUpModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = systemUnderTest.isFirstNameValid(firstName: "a")
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid() should have returned FALSE for a first name that is shorter than 2 charaters but it has returned TRUE")
    }

}
