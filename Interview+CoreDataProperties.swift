//
//  Interview+CoreDataProperties.swift
//  BlessedTeam
//
//  Created by Monica Butarbutar on 09/06/23.
//
//

import Foundation
import CoreData


extension Interview {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Interview> {
        return NSFetchRequest<Interview>(entityName: "Interview")
    }

    @NSManaged public var title: String?
    @NSManaged public var objective: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var id: Int16
    @NSManaged public var attribute: NSObject?
    @NSManaged public var questionList: NSObject?

}

extension Interview : Identifiable {

}
