//
//  SignUpWebServiceTests.swift
//  UnitTest ExampleTests
//
//  Created by Fomagran on 2021/06/08.
//

import XCTest
@testable import UnitTest_Example

class SignUpWebServiceTests: XCTestCase {
    

    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testSignUpWebService_WhenGivenSuccessfulResponse_ReturnSuccess() {
        
        //TODO:이게 뭔지 알아보기
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignUpWebService(urlString:SignUpConstants.signUpURLString,urlSession: urlSession)
            
        let signUpRequestModel = SignUpRequestModel(firstName: "Foma", lastName: "gran", email: "fomagran6@naver.com", password: "12341234")
        
        let expectation = self.expectation(description: "Signup web service response expectation")

        sut.signUp(with: signUpRequestModel) { response, error in
            XCTAssertEqual(response?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 3)

    }
    
    func testSignUpWebService_WhenReceiveDifferentJSONResponse_ErrotTookPlace() {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"path\": \"/users\",\"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignUpWebService(urlString:SignUpConstants.signUpURLString,urlSession: urlSession)
            
        let signUpRequestModel = SignUpRequestModel(firstName: "Foma", lastName: "gran", email: "fomagran6@naver.com", password: "12341234")
        
        let expectation = self.expectation(description: "Signup web service response expectation")

        sut.signUp(with: signUpRequestModel) { response, error in
            XCTAssertNil(response)
            XCTAssertEqual(error, SignUpErrors.responseModelParsingError)
            
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 3)
    }

}
