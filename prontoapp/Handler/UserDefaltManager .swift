//
//  UserDefaltManager .swift
//  pronto
//
//  Created by Navoda on 10/2/21.
//

import Foundation

class UserDefaltHandler : NSObject {
    
    private final var username_key = "USERNAME"
    private final var email_key = "EMAIL"

    func saveUsername(username : String){
        saveValuesByKey(key: username_key, value: username)
    }
    
    func saveEmail(email : String){
        saveValuesByKey(key: email_key, value: email)
    }
    
    func getUsername() -> String{
        return getValuesByKey(key: username_key)
    }
    
    func getEmail() -> String{
        return getValuesByKey(key: email_key)
    }
    
    private func saveValuesByKey(key: String , value : String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    private func getValuesByKey(key : String) -> String {
        let value = UserDefaults.standard.object(forKey: key)
        if value != nil {
            return value as! String
        } else {
            return ""
        }
    }
    
}
