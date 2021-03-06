//
//  SignUpWebService.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/08.
//

import Foundation

class SignUpWebService:SignUpWebServiceProtocol {
    
    private var urlSession:URLSession
    private var urlString:String
    
    init(urlString:String,urlSession:URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signUp(with requestModel:SignUpRequestModel,completion:@escaping(SignUpResponseModel?,SignUpError?)-> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil,SignUpError.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(requestModel)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            //TODO:Write a new unit test to handle and error here
            
            if let requestError = error {
                completion(nil,SignUpError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data,let signUpResponseModel = try? JSONDecoder().decode(SignUpResponseModel.self, from: data) {
                completion(signUpResponseModel,nil)
            }else {
                completion(nil,SignUpError.invalidResponseModel)
            }
        }
        dataTask.resume()
    }
    
}
