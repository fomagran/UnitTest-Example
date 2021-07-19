//
//  ViewController.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/07.
//

import UIKit

class SignupViewController: UIViewController, SignUpViewDelegateProtocol {

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var repeatTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    var signupPresenter:SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if signupPresenter == nil {
            let validator = SignUpModelValidator()
            let webservice = SignUpWebService(urlString: SignUpConstants.signUpURLString)
            signupPresenter = SignUpPresenter(validator: validator, webservice: webservice, delegate: self)
        }
    }
    
    func successfulSignUp() {
        //TODO:
    }
    
    func errorHandler(error: SignUpError) {
        //TODO:
    }

    @IBAction func tapSignupButton(_ sender: Any) {
        let signupModel = SignUpModel(firstName: "foma", lastName: "gran", email: "fomagran6@naver.com", password: "1234", repeatPassword: "1234")
        signupPresenter?.processUserSignUp(model: signupModel)
    }
    
}

