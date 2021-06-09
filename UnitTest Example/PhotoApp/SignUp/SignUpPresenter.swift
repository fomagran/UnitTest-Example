//
//  SignUpPresenter.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/09.
//

import Foundation

class SignUpPresenter {
    
    private var validator:SignUpModelValidatorProtocol
    
    init(validator:SignUpModelValidatorProtocol) {
        self.validator = validator
    }
    
    func processUserSignUp(model:SignUpModel) {
        if !validator.isFirstNameValid(firstName: model.firstName) {
            return
        }
    }
}
