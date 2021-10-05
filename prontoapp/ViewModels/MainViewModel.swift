//
//  MainViewModel.swift
//  pronto
//
//  Created by Navoda on 10/4/21.
//

import Foundation

class MainViewModel: NSObject {
    
    private(set) var notesList : [NoteItem]? = []{
        didSet{
            self.bindDataToController()
        }
    }

    var username : String!
    var email : String!
    var bindDataToController : (() -> ()) = {}

    func getAllNotes(){
        let dbHAndler = DBHandler()
        self.notesList = dbHAndler.getAllNotes()
    }

    func getUserDetails(){
        let userDefault = UserDefaltHandler()
        username = userDefault.getUsername()
        email = userDefault.getEmail()
    }

}
