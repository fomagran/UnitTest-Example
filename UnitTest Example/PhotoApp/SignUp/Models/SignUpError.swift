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
    case illigalCharatersFound
    case donotMatchRepeatPassword
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel,.invalidRequestURLString:
            return ""
        case .illigalCharatersFound:
            return "특수문자는 포함되면 안돼요"
        case .donotMatchRepeatPassword:
            return "비밀번호와 확인 비밀번호가 다릅니다."
        }
    }
}
