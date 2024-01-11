//
//  Participant+CoreDataProperties.swift
//  BlessedTeam
//
//  Created by Monica Butarbutar on 09/06/23.
//
//

import Foundation
import CoreData


extension Participant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Participant> {
        return NSFetchRequest<Participant>(entityName: "Participant")
    }

    @NSManaged public var name: String?
    @NSManaged public var timeStamp: Data?

}

extension Participant : Identifiable {

}
