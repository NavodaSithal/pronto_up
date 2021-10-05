//
//  FirstViewDataHandlerTest.swift
//  prontoappTests
//
//  Created by Navoda on 10/5/21.
//
@testable import prontoapp
import XCTest

class FirstViewDataHandlerTest: XCTestCase {

    var firstHandler : FirstViewDataHandler!
    var validUserMockStringArr : [String]!
    var invalidUserMockStringArr : [String]!
    var mockDelegate : MockFirstDelegate!

    override func setUp() {
        super.setUp()
        mockDelegate = MockFirstDelegate()
        firstHandler = FirstViewDataHandler(delegate: mockDelegate )
        validUserMockStringArr = ["navoda" , "test1234" , "test@gmail.com"]
        invalidUserMockStringArr = ["testuser" , "test1234_new" , "test@gmail.com"]

    }

    override func tearDown() {
        mockDelegate = nil
        firstHandler = nil
        validUserMockStringArr = nil
        invalidUserMockStringArr = nil

        super.tearDown()
    }
    
    func test_return_is_not_empty_fauls(){
        XCTAssertFalse(firstHandler.isNotEmptyQR(qrString: ""))
    }
    
    func test_return_is_not_empty_true(){
        XCTAssertTrue(firstHandler.isNotEmptyQR(qrString: "test_string"))
    }
    
    func test_user_validate_when_input_realuser_array(){
        let result = firstHandler.validateUserWithHardCodedValues(arr: validUserMockStringArr)
        XCTAssertTrue(result.0)
        XCTAssertEqual(ReturnMsg.success , result.1)
        
    }
    
    func test_user_validate_when_input_invalid_user_array(){
        let result = firstHandler.validateUserWithHardCodedValues(arr: invalidUserMockStringArr)
        XCTAssertFalse(result.0)
        XCTAssertEqual(ReturnMsg.authenticated , result.1)
        
    }
    
    func test_iscalled_delegate_for_valid_user(){
        firstHandler.validateUser(arr: validUserMockStringArr)
        XCTAssertTrue(mockDelegate.isUserIsAuthenticatedCalled)
        XCTAssertEqual(validUserMockStringArr[0] , mockDelegate.username)
    }
    
    func test_iscalled_delegate_for_invalid_user(){
        firstHandler.validateUser(arr: invalidUserMockStringArr)
        XCTAssertTrue(mockDelegate.isUserFaildToAuthenticateCalled)
        XCTAssertEqual(ReturnMsg.authenticated.rawValue , mockDelegate.err_msg)
    }
    
    func test_iscalled_deligete_for_invalid_qr_string(){
        firstHandler.separateString(qrString: "test_yui")
        XCTAssertTrue(mockDelegate.isUserFaildToAuthenticateCalled)
        XCTAssertEqual(ReturnMsg.invalid.rawValue , mockDelegate.err_msg)
    }
    
}

class MockFirstDelegate : FirstViewDelegate{
    
    var isUserIsAuthenticatedCalled = false
    var isUserFaildToAuthenticateCalled = false
    var username = ""
    var err_msg = ""

    
    func authSuccessUser(name: String) {
        isUserIsAuthenticatedCalled = true
        username = name
    }
    
    func authFailQrCode(errMsg: String) {
        isUserFaildToAuthenticateCalled = true
        err_msg = errMsg

    }
    
    
}
