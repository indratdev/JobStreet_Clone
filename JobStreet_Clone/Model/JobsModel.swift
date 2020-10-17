//
//  JobsModel.swift
//  JobStreet_Clone
//
//  Created by IndratS on 17/10/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import Foundation

struct JobsModel {
    let id: Int
    let jobsName: String
    let jobsCompany: String
    let jobsLocation: String
    let jobsSalary: String
    let jobsTime: Date
    let isSaved: Bool = false
    let jobsCompanyLogo: String?
    let jobsDescription: String
    let joinUS: String
    let jobsPosition: String
    let jobsQualification: String
    let jobsExperience: Int
    let jobsType: String
    let jobsSpecializations: String
    let companyOverview: String
    let companyAddress: String
    let jobsBenefit: String
    let companySize: String
}
