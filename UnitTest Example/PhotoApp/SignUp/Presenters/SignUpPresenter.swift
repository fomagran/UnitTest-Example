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
    private var delegate:SignUpViewDelegateProtocol
    
    init(validator:SignUpModelValidatorProtocol,webservice:SignUpWebServiceProtocol,delegate:SignUpViewDelegateProtocol) {
        self.validator = validator
        self.webservice = webservice
        self.delegate = delegate
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
        
        webservice.signUp(with: requestModel) { [weak self] response, error in
            if let _ = response {
                self?.delegate.successfulSignUp()
                return
            }
        }
        
   
    }
}
