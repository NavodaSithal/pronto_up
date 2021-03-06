//
//  DBHandler.swift
//  pronto
//
//  Created by Navoda on 10/2/21.
//

import Foundation
import UIKit

class DBHandler : NSObject{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getAllNotes()-> [NoteItem]{
        do {
            let items : [NoteItem] = try context.fetch(NoteItem.fetchRequest())
            return items
        } catch {
            //error
        }
        return []
    }
    
    func saveNote(note : NoteObj){
        let newNote = NoteItem(context : context)
        newNote.note = note.note
        newNote.createdDate = note.createdDate
        
        do {
            try context.save()
        } catch  {
            
        }
    }

}


