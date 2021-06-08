//
//  SignUpWebServiceTests.swift
//  UnitTest ExampleTests
//
//  Created by Fomagran on 2021/06/08.
//

import XCTest
@testable import UnitTest_Example

class SignUpWebServiceTests: XCTestCase {
    
    let sut:SignUpWebService = SignUpWebService()

    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    func testSignUpWebService_WhenGivenSuccessfulResponse_ReturnSuccess() {
        let signUpRequestModel = SignUpRequestModel(firstName: "Foma", lastName: "gran", email: "fomagran6@naver.com", password: "1234")
        let expectation = self.expectation(description: "Signup web service response expectation")
        sut.signUp(with: signUpRequestModel) { response, error in
            XCTAssertEqual(response?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
        
    
    }

}
