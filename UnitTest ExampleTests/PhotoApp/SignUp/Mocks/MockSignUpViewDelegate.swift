//
//  MockSignUpViewDelegate.swift
//  UnitTest ExampleTests
//
//  Created by Fomagran on 2021/06/09.
//

import Foundation
import XCTest
@testable import UnitTest_Example

class MockSignUpViewDelegate:SignUpViewDelegateProtocol {
    
    var expectation:XCTestExpectation?
    var successfulSignUpCounter:Int = 0
    
    func successfulSignUp() {
        successfulSignUpCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignUpError) {
        
    }

}

