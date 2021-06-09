//
//  SignUpPresenter.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/09.
//

import Foundation

class SignUpPresenter {
    
    private var validator:SignUpModelValidatorProtocol
    private var webservice:SignUpWebServiceProtocol
    
    init(validator:SignUpModelValidatorProtocol,webservice:SignUpWebServiceProtocol) {
        self.validator = validator
        self.webservice = webservice
    }
    
    func processUserSignUp(model:SignUpModel) {
        if !validator.isFirstNameValid(firstName: model.firstName) {
            return
        }
        if !validator.isValidPassword(password: model.password) {
            return
        }
        if !validator.doPasswordsMatch(password: "1234", repeatPassword: "1234") {
            return
        }
        
        let requestModel = SignUpRequestModel(firstName: model.firstName, lastName: model.lastName, email: model.email, password: model.password)
        
        webservice.signUp(with: requestModel) { response, error in
            
        }
    }
}
