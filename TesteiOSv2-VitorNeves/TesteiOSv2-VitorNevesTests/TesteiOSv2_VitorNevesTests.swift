//
//  TesteiOSv2_VitorNevesTests.swift
//  TesteiOSv2-VitorNevesTests
//
//  Created by joao.vitor.f.naves on 05/02/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import XCTest
@testable import TesteiOSv2_VitorNeves

class TesteiOSv2_VitorNevesTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    // Testing with valid email
    func testEmail() {
        let email = "teste@gmail.com"
        XCTAssertTrue(email.isValidEmail())
    }
    
    // Testing with valid CPF
    func testCPF() {
        let cpf = "41419757610"
        XCTAssertTrue(cpf.isValidCPF())
    }
    
    // Testing with InValid CPF
    func testInValidCPF(){
        let cpf = "12345678912"
        XCTAssertFalse(cpf.isValidCPF())
    }
    
    // Testing with valid password
    func testPassword() {
        let password = "qweQWE123!@#"
        XCTAssertTrue(password.isValidPassword())
    }
    
    func testLogin() {
        let worker = LocationWorker()
        let email = "teste@gmail.com"
        let password = "qweQWE123!@#"
        worker.login(user: email, password: password, responseRequest: { response in
            XCTAssertNil(response.error)
        })
    }
    
    func testCurrency() {
        let worker = CurrencyWorker()
        worker.fetchStatements(userId: 1) { response in
            if response.statements != nil {
                XCTAssert(true);
            } else {
                XCTAssert(false)
            }
        }
    }

}
