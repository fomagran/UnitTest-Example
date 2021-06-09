//
//  SignUpViewDelegateProtocol.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/09.
//

import Foundation

protocol SignUpViewDelegateProtocol:AnyObject {
    func successfulSignUp()
    func errorHandler(error:SignUpError)
}
