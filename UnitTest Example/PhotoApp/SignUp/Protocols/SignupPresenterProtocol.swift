//
//  SignupPresenterProtocol.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/07/19.
//

import Foundation

protocol SignupPresenterProtocol:AnyObject {
    
    init(validator:SignUpModelValidatorProtocol,webservice:SignUpWebServiceProtocol,delegate:SignUpViewDelegateProtocol)
    
    func processUserSignUp(model:SignUpModel)
}
