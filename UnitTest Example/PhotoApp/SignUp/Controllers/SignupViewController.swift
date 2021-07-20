//
//  ViewController.swift
//  UnitTest Example
//
//  Created by Fomagran on 2021/06/07.
//

import UIKit

class SignupViewController: UIViewController {

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
    

    @IBAction func tapSignupButton(_ sender: Any) {
        let signupModel = SignUpModel(firstName: firstNameTextField.text ?? "", lastName: "gran", email: "fomagran6@naver.com", password: passwordTF.text ?? "", repeatPassword: repeatTF.text ?? "")
//        signupPresenter?.processUserSignUp(model: signupModel)
        
        if passwordTF.text != repeatTF.text {
            let alert = UIAlertController(title: "Error", message:"비밀번호와 확인 비밀번호가 다릅니다", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            DispatchQueue.main.async {
                //테스트를 위해 accessibilityIdentifier를 정해줘야함
                alert.view.accessibilityIdentifier = "errorAlertDialog"
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension SignupViewController:SignUpViewDelegateProtocol {
    func successfulSignUp() {
        //TODO:
    }
    
    func errorHandler(error: SignUpError) {
        let alert = UIAlertController(title: "Error", message:error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            //테스트를 위해 accessibilityIdentifier를 정해줘야함
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
}

