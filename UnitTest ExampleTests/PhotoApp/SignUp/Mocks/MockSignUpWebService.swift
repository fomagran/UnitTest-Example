//
//  MockSignUpWebService.swift
//  UnitTest ExampleTests
//
//  Created by Fomagran on 2021/06/09.
//

import Foundation
@testable import UnitTest_Example

class MockSignUpWebService:SignUpWebServiceProtocol {
    
    var isSignUpMethodCalled:Bool  = false
    
    func signUp(with requestModel: SignUpRequestModel, completion: @escaping (SignUpResponseModel?, SignUpError?) -> Void) {
        isSignUpMethodCalled = true
    }
    
}
