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
    var shouldReturnError:Bool = false
    
    func signUp(with requestModel: SignUpRequestModel, completion: @escaping (SignUpResponseModel?, SignUpError?) -> Void) {
        isSignUpMethodCalled = true
        
        if shouldReturnError {
            completion(nil,SignUpError.failedRequest(description: "SignUp request was not successful"))
        }else {
            let response = SignUpResponseModel(status: "ok")
            completion(response,nil)
        }
    
    }
}
