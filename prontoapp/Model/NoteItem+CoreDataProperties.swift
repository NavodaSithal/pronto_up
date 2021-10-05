//
//  NoteItem+CoreDataProperties.swift
//  prontoapp
//
//  Created by Navoda on 10/5/21.
//
//

import Foundation
import CoreData


extension NoteItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteItem> {
        return NSFetchRequest<NoteItem>(entityName: "NoteItem")
    }

    @NSManaged public var note: String?
    @NSManaged public var createdDate: Date?

}
