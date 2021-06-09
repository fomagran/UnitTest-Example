//
//  SignUpWebServiceProtocol.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/09.
//

import Foundation

protocol SignUpWebServiceProtocol {
    func signUp(with requestModel:SignUpRequestModel,completion:@escaping(SignUpResponseModel?,SignUpError?)-> Void)
}
