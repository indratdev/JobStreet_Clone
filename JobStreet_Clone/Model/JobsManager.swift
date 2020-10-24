//
//  JobsManager.swift
//  JobStreet_Clone
//
//  Created by IndratS on 17/10/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import Foundation

struct JobsManager {
    let allJobs = [
        JobsModel(
            id: 1,
            jobsName: "IT QA Engineer",
            jobsCompany: "PT Ako Media Asia",
            jobsLocation: "Indonesia - Jakarta Raya",
            jobsSalary: "Sekitar gaji yang diharapkan",
            jobsTime: Date(),
            jobsCompanyLogo: "PT Ako Media Asia",
            jobsDescription: """
            Becoming a supervisor to a QA team who enables the team to perform functional testing and layout testing pre UAT, as well as other supplementary testing such as VA and load testing pre deployment and perform a final end to end testing after deployment.
            Progress consistently by providing direction, set up and maintain testing  procedures to ensure all applications delivered on SALT quality standard, and choaching team members along the way.
            Also, to lead growth and innovation for all aspects of the team especially in maintaining deliverable quality to
            
            ensure client’s happiness and drive customer retention though in-scope-bug-free application.
            """,
            joinUS:
            """
            SALT is a great place to push your career to the next level. SALT is a one of the leading technology agency in Indonesia. Our culture is built on collaboration and innovation in family oriented company. SALT has a training roadmap for each individual to ensure you are successful in your role and growth. Last but not least, our people is our brand.
            """,
            jobsPosition: "Supervisor/Koordinator",
            jobsQualification:
            """
            - Deep knowledge in Automated Testing (with Selenium Web Driver), Load testing (with Apache jMeter), and Vulnerability Assesment.
            - Have knowledge about HTML & Javascript is a plus
            - Deep understanding in QA - DevOps Integration
            - At least S1 in Information Technology, Computer Science, and Information System.
            - Having a deep understanding of quality assurance is a must, with minimum of 4 years experiences
            - Deep understanding in business process and resource management
            
            Innovative:
            - Reengineers process for maximum efficiency and believe in competitive advantage to both work smarter and stay lean.
            - Follow-through on commitments (Integrity) and Persistence.
            
            Proactivity:
            - Acts without being told what to do. Brings new ideas to the company.
            - Excellent verbal and written communication skills (English and Bahasa Indonesia)
            - Ability to solve issues and risk management
            """,
            jobsExperience: 4,
            jobsType: "Full Time",
            jobsSpecializations: "Konsultasi (IT, Ilmu Pengetahuan, Teknis & Teknikal)",
            companyOverview:
            """
            SALT is a Digital Transformation Company with UX (User Experience), data and technology focus. We thrive in our marketing technology strategy, system integration and development capability.
            
            Our vision is to be the leading and most innovative technology company in Indonesia
            Our portfolio ranges from large company to MNC Corporations. We have helped them in developing ROI and sustainable marketing ecosystem platform to improve their business revenue as well as create efficiency in their operating costs.
            
            Our staff is highly trained individuals that have experience in overseas as well as Indonesia.
            """,
            companyAddress: "Jalan Taman Daan Mogot 6 no 6, West Jakarta, Jakarta, Indonesia",
            jobsBenefit: "Kesehatan, Tunjangan Lainnya",
            companySize: "51 - 200"),
        
        JobsModel(
            id: 2,
            jobsName: "IOS DEVELOPER",
            jobsCompany: "TOKOPEDIA",
            jobsLocation: "Indonesia - Jakarta Raya",
            jobsSalary: "15000000",
            jobsTime: Date(),
            jobsCompanyLogo: "TOKOPEDIA",
            jobsDescription:
            """
        Becoming a supervisor to a QA team who enables the team to perform functional testing and layout testing pre UAT, as well as other supplementary testing such as VA and load testing pre deployment and perform a final end to end testing after deployment. Progress consistently by providing direction, set up and maintain testing  procedures to ensure all applications delivered on SALT quality standard, and choaching team members along the way. Also, to lead growth and innovation for all aspects of the team especially in maintaining deliverable quality to ensure client’s happiness and drive customer retention though in-scope-bug-free application.
        """,
            joinUS:
            """
        SALT is a great place to push your career to the next level. SALT is a one of the leading technology agency in Indonesia. Our culture is built on collaboration and innovation in family oriented company. SALT has a training roadmap for each individual to ensure you are successful in your role and growth. Last but not least, our people is our brand.
        """,
            jobsPosition: "Supervisor/Koordinator",
            jobsQualification:
            """
        Deep knowledge in Automated Testing (with Selenium Web Driver), Load testing (with Apache jMeter), and Vulnerability Assesment.
        Have knowledge about HTML & Javascript is a plus
        Deep understanding in QA - DevOps Integration
        At least S1 in Information Technology, Computer Science, and Information System.
        Having a deep understanding of quality assurance is a must, with minimum of 4 years experiences
        Deep understanding in business process and resource management
        Innovative:
        Reengineers process for maximum efficiency and believe in competitive advantage to both work smarter and stay lean.
        Follow-through on commitments (Integrity) and Persistence.
        Proactivity : Acts without being told what to do. Brings new ideas to the company.
        Excellent verbal and written communication skills (English and Bahasa Indonesia)
        Ability to solve issues and risk management
        """,
            jobsExperience: 4,
            jobsType: "Full Time",
            jobsSpecializations: "Konsultasi (IT, Ilmu Pengetahuan, Teknis & Teknikal)",
            companyOverview:
            """
        SALT is a Digital Transformation Company with UX (User Experience), data and technology focus. We thrive in our marketing technology strategy, system integration and development capability.
        
        Our vision is to be the leading and most innovative technology company in Indonesia
        Our portfolio ranges from large company to MNC Corporations. We have helped them in developing ROI and sustainable marketing ecosystem platform to improve their business revenue as well as create efficiency in their operating costs.
        
        Our staff is highly trained individuals that have experience in overseas as well as Indonesia.
        """,
            companyAddress: "Jalan Taman Daan Mogot 6 no 6, West Jakarta, Jakarta, Indonesia",
            jobsBenefit: "Kesehatan, Tunjangan Lainnya",
            companySize: "51 - 200")
        
    ]
    
    func getNumberIndex(id: Int) -> JobsModel? {
        var dataOwn: JobsModel?
        
        for (_,data) in allJobs.enumerated() {
            if data.id == id {
                dataOwn = data
            }
        }
        return dataOwn
    }
    
    
}
