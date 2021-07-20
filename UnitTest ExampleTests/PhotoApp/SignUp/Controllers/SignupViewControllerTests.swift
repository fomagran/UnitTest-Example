//
//  SignupViewControllerTests.swift
//  UnitTest ExampleTests
//
//  Created by Fomagran on 2021/07/19.
//

import XCTest
@testable import UnitTest_Example

class SignupViewControllerTests: XCTestCase {
    
    var storyboard:UIStoryboard!
    var sut:SignupViewController!
    var nav:UINavigationController!

    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        //뷰를 로드해줘야 테스트를 할 수 있다.
        sut.loadViewIfNeeded()
        nav = UINavigationController(rootViewController: sut)
    }

    override func tearDownWithError() throws {
        sut = nil
        nav = nil
    }
    
    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        //outlet이 연결되었는지 안되었는지 확인할 수 있다.
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField)
        let passwordTF = try XCTUnwrap(sut.passwordTF)
        let repeatTF = try XCTUnwrap(sut.repeatTF)
        XCTAssertEqual(firstNameTextField.text, "")
        XCTAssertEqual(passwordTF.text, "")
        XCTAssertEqual(repeatTF.text, "")
    }
    
    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        let signupButton:UIButton = try XCTUnwrap(sut.signupButton,"Signup button does not have a referencing outlet")
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside),"Signup button does not have a referencing outlet")
        XCTAssertEqual(signupButtonActions.count, 1)
        //tapSignupButton 액션이 있는지 확인 반드시 : 붙여줘야함
        XCTAssertEqual(signupButtonActions.first,"tapSignupButton:")
    }
    
    func testSignupViewController_WhenSignupButtonTapped_InvokeSignupProcess() throws {
        let mockValidator = MockSignUpModelValidator()
        let mockWebservice = MockSignUpWebService()
        let mockDelegate = MockSignUpViewDelegate()
        let mockSignupPresenter = MockSignupPresenter(validator:mockValidator , webservice: mockWebservice, delegate: mockDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        
        sut.signupButton.sendActions(for: .touchUpInside)
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled)
    }
    
    func testFirstNameTextField_WhenCreated_HasGivenNameContentTypeSet() throws {
        let firstNameTF = try XCTUnwrap(sut.firstNameTextField)
        XCTAssertEqual(firstNameTF.textContentType, .givenName,"FirstName 텍스트필드 컨텐트타입은 GivenName이어야 하는데 그렇지 않네요")
    }
    
    func testPasswordTextField_WhenCreated_HasSecureTextEntrySet() throws {
        let passwordTF = try XCTUnwrap(sut.passwordTF)
        XCTAssertTrue(passwordTF.isSecureTextEntry,"비밀번호는 SecureTextEntry로 설정되어야 하는데 그렇지 않네요")
    }
    
    func testSignupButton_WhenTapped_PushMainViewController() {
        
        let myPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is MainViewController
        }
    
        expectation(for: myPredicate, evaluatedWith: nav)
        
        sut.signupButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 1)
    }

}
