//
//  NewNoteHandler.swift
//  pronto
//
//  Created by Navoda on 10/4/21.
//

import Foundation

class NewNoteHandler : NSObject {
    
    init(text : String){
        super.init()
        createNoteObect(text: text)
    }
    
    private func createNoteObect(text : String){
        let note = NoteObj()
        note.note = text
        note.createdDate = Date()
        saveNoteToDB(note: note)
    }
    
    private func saveNoteToDB(note : NoteObj){
        let dbHandler = DBHandler()
        dbHandler.saveNote(note: note)
    }
}
