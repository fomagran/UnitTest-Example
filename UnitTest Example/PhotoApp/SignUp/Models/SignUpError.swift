//
//  SignUpErrors.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/08.
//

import Foundation

enum SignUpError:LocalizedError,Equatable {
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description:String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel,.invalidRequestURLString:
            return ""
        }
    }
}
