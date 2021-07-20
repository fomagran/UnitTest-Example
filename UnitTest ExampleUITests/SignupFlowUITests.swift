//
//  SignupFlowUITests.swift
//  UnitTest ExampleUITests
//
//  Created by Fomagran on 2021/07/20.
//

import XCTest

class SignupFlowUITests: XCTestCase {
    
    private var app:XCUIApplication!
    private var emailTF:XCUIElement!
    private var passwordTF:XCUIElement!
    private var repeatPasswordTF:XCUIElement!
    private var signupButton:XCUIElement!
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
        emailTF = app.textFields["emailTF"]
        passwordTF = app.textFields["passwordTF"]
        repeatPasswordTF = app.textFields["repeatPasswordTF"]
        signupButton = app.buttons["signupButton"]
        
    }
    
    override func tearDownWithError() throws {
        app = nil
        emailTF = nil
        passwordTF = nil
        repeatPasswordTF = nil
        signupButton = nil
        try super.tearDownWithError()
    }
    
    
    func testSignupViewController_WhenviewLoaded_RequiredUIElementsAreEnabled() throws {
        
        XCTAssertTrue(emailTF.isEnabled)
        XCTAssertTrue(passwordTF.isEnabled)
        XCTAssertTrue(repeatPasswordTF.isEnabled)
        XCTAssertTrue(signupButton.isEnabled)
    }
    
        func testSignupViewController_DonotMatchPasswordAndRepeatPassword_PresentErrorAlertDialog() {
        
        //Act
        emailTF.tap()
        emailTF.typeText("fomagran6@naver.com")
        
        passwordTF.tap()
        passwordTF.typeText("12345678")
        
        repeatPasswordTF.tap()
        repeatPasswordTF.typeText("123456")
        
            XCUIApplication()/*@START_MENU_TOKEN@*/.textFields["emailTF"]/*[[".textFields[\"email\"]",".textFields[\"emailTF\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        signupButton.tap()
        
        //Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1),"잘못된 정보를 입력하면 경고창이 떠야하는데 안떴어요")
    }
}
