//
//  LocationViewControllerUITests.swift
//  TesteiOSv2-VitorNevesUITests
//
//  Created by joao.vitor.f.naves on 06/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import XCTest

class LocationViewControllerUITests: XCTestCase {

    let userCPFValid: String = "39728922337"
    let userCPFInValid: String = "39728922330"
    let passwordValid: String = "aaAA11@@\n"
    let passwordInValid: String = "aaAA1100\n"
    
    private func hidesKeyboard(_ app: XCUIApplication) {
        let firstKey = XCUIApplication().keys.element(boundBy: 0)
        if firstKey.exists {
            app.typeText("\n")
        }
    }
    
    override func setUp() {
        
        continueAfterFailure = false
        
        XCUIApplication().launch()
        
    }
    
    override func tearDown() {
        
    }
    
    // UI Test to validate Login successfully
    func testLoginSucess() {
        
        //iniciate the Aplication
        let app = XCUIApplication()
        //get user text field
        let userTextField = app.textFields["User"]
        //check user text field if exist
        XCTAssertTrue(userTextField.exists)
        //tap on the user text field
        userTextField.tap()
        //clean user
        userTextField.typeText("")
        //insert valid user data into user text field
        userTextField.typeText(userCPFValid)
        
        
        //get passord text field
        let passwordSecureTextField = app.secureTextFields["Password"]
        //check passord text field if exist
        XCTAssertTrue(passwordSecureTextField.exists)
        //tap on the password text field
        passwordSecureTextField.tap()
        //clear password
        passwordSecureTextField.typeText("")
        //insert valid password data into passord text field
        passwordSecureTextField.typeText(passwordValid)
        
        //get login button
        let loginButton = app.buttons["Login"]
        //check login button if exist
        XCTAssertTrue(loginButton.exists)
        
        //hiddding keyboard
        hidesKeyboard(app)
        //tap on login button
        //loginButton.forceTap()
        
        
        //get logout button
        let lougouButton = app.buttons["logout 2"]
        
        
        let expectation = XCTKVOExpectation(keyPath: "exists", object: lougouButton,
                                            expectedValue: true)
        let _ = XCTWaiter().wait(for: [expectation], timeout: 5)
        
        
        
        
        //check logou button if exist
        XCTAssertTrue(lougouButton.exists)
        //tap on logout button
        //lougouButton.forceTap()
        
        
        //get login button again
        let loginButton2 = app.buttons["Login"]
        //check login button if exist again
        XCTAssertTrue(loginButton2.exists)
        
        
        //if all steps abuve success then all right
    }
    
    
    // UI Test to validate Login with invalid user
    func testLoginInvalidUser() {
        
        //iniciate the Aplication
        let app = XCUIApplication()
        //get user text field
        let userTextField = app.textFields["User"]
        //check user text field if exist
        XCTAssertTrue(userTextField.exists)
        //tap on the user text field
        userTextField.tap()
        //insert valid user data into user text field
        userTextField.typeText(userCPFInValid)
        
        
        //get passord text field
        let passwordSecureTextField = app.secureTextFields["Password"]
        //check passord text field if exist
        XCTAssertTrue(passwordSecureTextField.exists)
        //tap on the password text field
        passwordSecureTextField.tap()
        //insert valid password data into passord text field
        passwordSecureTextField.typeText(passwordValid)
        
        //get login button
        let loginButton = app.buttons["Login"]
        //check login button if exist
        XCTAssertTrue(loginButton.exists)
        //hiddding keyboard
        hidesKeyboard(app)
        //tap on login button
        //loginButton.forceTap()
        
        
        //get Error alert
        
        let expectation = XCTNSNotificationExpectation(name: NSNotification.Name(rawValue: "Nome do usuário incorreto"))
        let _ = XCTWaiter().wait(for: [expectation], timeout: 5)
        
        let nomeDoUsuRioIncorretoAlert = app.alerts["Nome do usuário incorreto"]
        //check if error alert exist
        XCTAssertTrue(nomeDoUsuRioIncorretoAlert.exists)
        //Tap action button on alert message
        nomeDoUsuRioIncorretoAlert.buttons["Tentar novamente"].tap()
        
        
        //if all steps abuve success then all right
    }
    
    
    // UI Test to validate Login with invalid password
    func testLoginInvalidPassword() {
        
        //iniciate the Aplication
        let app = XCUIApplication()
        //get user text field
        let userTextField = app.textFields["User"]
        //check user text field if exist
        XCTAssertTrue(userTextField.exists)
        //tap on the user text field
        userTextField.tap()
        //insert valid user data into user text field
        userTextField.typeText(userCPFValid)
        
        
        //get passord text field
        let passwordSecureTextField = app.secureTextFields["Password"]
        //check passord text field if exist
        XCTAssertTrue(passwordSecureTextField.exists)
        //tap on the password text field
        passwordSecureTextField.tap()
        //insert valid password data into passord text field
        passwordSecureTextField.typeText(passwordInValid)
        
        //get login button
        let loginButton = app.buttons["Login"]
        //check login button if exist
        XCTAssertTrue(loginButton.exists)
        //hiddding keyboard
        hidesKeyboard(app)
        //tap on login button
        //loginButton.forceTap()
        
        
        //get Error alert
        
        let expectation = XCTNSNotificationExpectation(name: NSNotification.Name(rawValue: "Senha inválida"))
        let _ = XCTWaiter().wait(for: [expectation], timeout: 5)
        
        let passwordSecureIncorretoAlert = app.alerts["Senha inválida"]
        //check if error alert exist
        XCTAssertTrue(passwordSecureIncorretoAlert.exists)
        //Tap action button on alert message
        passwordSecureIncorretoAlert.buttons["Tentar novamente"].tap()
        
        //if all steps abuve success then all right
    }
}
