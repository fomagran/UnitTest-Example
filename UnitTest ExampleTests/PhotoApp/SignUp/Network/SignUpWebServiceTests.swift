//
//  SignUpWebServiceTests.swift
//  UnitTest ExampleTests
//
//  Created by Fomagran on 2021/06/08.
//

import XCTest
@testable import UnitTest_Example

class SignUpWebServiceTests: XCTestCase {
    
    var sut:SignUpWebService!
    var signUpRequestModel:SignUpRequestModel!

    override func setUp() {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignUpWebService(urlString:SignUpConstants.signUpURLString,urlSession: urlSession)
            
        signUpRequestModel = SignUpRequestModel(firstName: "Foma", lastName: "gran", email: "fomagran6@naver.com", password: "12341234")
    
        
    }
    
    override func tearDown() {
        sut = nil
        signUpRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }
    
    func testSignUpWebService_WhenGivenSuccessfulResponse_ReturnSuccess() {
 
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        
        let expectation = self.expectation(description: "Signup web service response expectation")

        sut.signUp(with: signUpRequestModel) { response, error in
            XCTAssertEqual(response?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 3)

    }
    
    func testSignUpWebService_WhenReceiveDifferentJSONResponse_ErrotTookPlace() {
        
        let jsonString = "{\"path\": \"/users\",\"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")

        sut.signUp(with: signUpRequestModel) { response, error in
            XCTAssertNil(response,"The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignUpErrors.responseModelParsingError,"The signUp() method did not return expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 3)
    }
    
    func testSignUpWebservice_WhenURLStringProvided_ReturnError() {
        
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        sut = SignUpWebService(urlString: "")
        
        sut.signUp(with: signUpRequestModel) { response, error in
            XCTAssertEqual(error, SignUpErrors.invalidRequestURLStringError)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }

}
