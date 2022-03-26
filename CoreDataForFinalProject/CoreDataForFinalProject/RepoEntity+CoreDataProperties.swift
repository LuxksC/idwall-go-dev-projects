//
//  RepoEntity+CoreDataProperties.swift
//  CoreDataForFinalProject
//
//  Created by Sandra Monteiro de Castro on 24/03/22.
//
//

import Foundation
import CoreData


extension RepoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RepoEntity> {
        return NSFetchRequest<RepoEntity>(entityName: "RepoEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var imageUrl: String?
    @NSManaged public var repoDescription: String?
    @NSManaged public var repoTitle: String?

}

extension RepoEntity : Identifiable {

}
