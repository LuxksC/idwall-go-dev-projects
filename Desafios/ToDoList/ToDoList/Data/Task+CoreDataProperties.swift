//
//  Task+CoreDataProperties.swift
//  ToDoList
//
//  Created by Sandra Monteiro de Castro on 26/03/22.
//
//

import Foundation
import CoreData

extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var status: Int16
    @NSManaged public var createdAt: Date?
    @NSManaged public var dueAt: Date?

}

extension Task : Identifiable {

}
