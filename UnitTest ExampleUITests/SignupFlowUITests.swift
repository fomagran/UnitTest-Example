//
//  SignupFlowUITests.swift
//  UnitTest ExampleUITests
//
//  Created by Fomagran on 2021/07/20.
//

import XCTest

class SignupFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testSignupViewController_WhenviewLoaded_RequiredUIElementsAreEnabled() throws {
        let app = XCUIApplication()
        app.launch()
        let firestNameTextField = app.textFields["First name"]
        let passwordSecureTextField = app.secureTextFields["Password"]
        let repeatPasswordSecureTextField = app.secureTextFields["Repeat Password"]
        let signupButton = app.buttons["Sign Up"]
        
        XCTAssertTrue(firestNameTextField.isEnabled)
        XCTAssertTrue(passwordSecureTextField.isEnabled)
        XCTAssertTrue(repeatPasswordSecureTextField.isEnabled)
        XCTAssertTrue(signupButton.isEnabled)
    }

}
