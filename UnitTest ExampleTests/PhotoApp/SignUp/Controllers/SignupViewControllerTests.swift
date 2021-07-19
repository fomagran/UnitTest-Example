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

    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        //뷰를 로드해줘야 테스트를 할 수 있다.
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        
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

}
