//
//  ShowNoteViewModel.swift
//  pronto
//
//  Created by Navoda on 10/4/21.
//

import Foundation

class ShowNoteViewModel: NSObject {
    
    var noteObj : NoteItem!

    init(note : NoteItem) {
        self.noteObj = note
    }
}
