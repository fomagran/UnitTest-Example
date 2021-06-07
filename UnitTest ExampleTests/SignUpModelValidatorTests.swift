//
//  SignUpModelValidator.swift
//  UnitTest ExampleTests
//
//  Created by Fomagran on 2021/06/07.
//

import XCTest
@testable import UnitTest_Example

class SignUpModelValidatorTests: XCTestCase {

    override func setUp() {
        print("set up")
    }
    
    override func tearDown() {
        print("tear dwon")
    }
    
    func testSignUpModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        //Arrange
        let systemUnderTest = SignUpModelValidator()
        
        //Act
        let isFirstNameValid = systemUnderTest.isFirstNameValid(firstName:"An")
        
        //Assert
        XCTAssertTrue(isFirstNameValid,"The isFirstNameValid() should have returned TRUE for a valid firs name but returned FALSE")
    }

}
