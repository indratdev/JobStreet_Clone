//
//  DetailJobsVC.swift
//  JobStreet_Clone
//
//  Created by IndratS on 17/10/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit

class DetailJobsVC: UIViewController {
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var jobDescriptionLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    let jobM = JobsManager()
    var detailID: Int? = 0
    var data: JobsModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        data = jobM.getNumberIndex(id: detailID!)

        loadUI()
    }
    
    
    func loadUI(){
        //section 1
        if let datee = data?.jobsTime {
            timeLabel.text = "\(data?.jobsSalary ?? "") \n\(datee)"
        }
        positionLabel.text = data?.jobsName
        companyLabel.text = data?.jobsCompany
        locationLabel.text = data?.jobsLocation
        
        //section 2
       loadSegmentControl()
        
    }
    
    private func loadSegmentControl(){
        segmentControl.setTitle("Job Description", forSegmentAt: 0)
        segmentControl.setTitle("Company Overview", forSegmentAt: 1)
        segmentControl.selectedSegmentIndex = 0
    }

   

}
