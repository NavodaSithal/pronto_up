//
//  FirstViewDataHandler.swift
//  pronto
//
//  Created by Navoda on 10/3/21.
//

import Foundation

protocol FirstViewDelegate {
    func authSuccessUser(name : String)
    func authFailQrCode(errMsg : String)
}

class FirstViewDataHandler : NSObject {
    
    private var delegate : FirstViewDelegate!
    private var separateCode = "_|&&|_"
    private let hardCodedUsername : String = "navoda"
    private let hardCodedPsw : String = "test1234"

    init(delegate : FirstViewDelegate){
        super.init()
        self.delegate = delegate
    }

    
    func manageQR(qrString : String){
        if isNotEmptyQR(qrString: qrString){
            separateString(qrString: qrString)
        }else{
            delegate.authFailQrCode(errMsg: ReturnMsg.invalid.rawValue)
        }
    }
    
    func isNotEmptyQR(qrString : String) -> Bool{
        if qrString != ""{
           return true
        }else{
          return false
        }
    }
    
    func separateString(qrString : String){
        let strArr = qrString.components(separatedBy: separateCode)
        if strArr.count == 3 {
            validateUser(arr: strArr)
        }else{
            delegate.authFailQrCode(errMsg: ReturnMsg.invalid.rawValue)
        }
    }
    
    func validateUserWithHardCodedValues(arr : [String]) -> (Bool, ReturnMsg){
        if hardCodedUsername == arr[0] && hardCodedPsw == arr[1]{
            return (true , ReturnMsg.success)
        }else{
            return (false , ReturnMsg.authenticated)
        }
    }
    
    func validateUser(arr : [String]){
        let result = validateUserWithHardCodedValues(arr: arr)
        
        if result.0{
            saveUserDetails(arr: arr)
            delegate.authSuccessUser(name: arr[0])
        }else{
            delegate.authFailQrCode(errMsg: result.1.rawValue)
        }
    }
    
    func saveUserDetails(arr : [String]){
        let userDefault = UserDefaltHandler()
        let username = arr[0]
        let email = arr[2]
        
        if userDefault.getUsername() != username{
            userDefault.saveUsername(username: username)
        }
        
        if userDefault.getEmail() != email{
            userDefault.saveEmail(email: email)
        }
    }

    
}
