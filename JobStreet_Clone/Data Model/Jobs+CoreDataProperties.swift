//
//  Jobs+CoreDataProperties.swift
//  JobStreet_Clone
//
//  Created by IndratS on 24/10/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//
//

import Foundation
import CoreData


extension Jobs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Jobs> {
        return NSFetchRequest<Jobs>(entityName: "Jobs")
    }

    @NSManaged public var id_jobs: Int64
    @NSManaged public var actived: Int64

}
