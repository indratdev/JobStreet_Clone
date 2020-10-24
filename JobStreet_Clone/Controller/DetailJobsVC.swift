//
//  DetailJobsVC.swift
//  JobStreet_Clone
//
//  Created by IndratS on 17/10/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit

class DetailJobsVC: UIViewController {
    @IBOutlet weak var viewDescription: UIView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var jobDescriptionLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var viewCompanyOverview: UIView!
    @IBOutlet weak var myScroolview: UIScrollView!
    @IBOutlet weak var joinUSLabel: UILabel!
    @IBOutlet weak var additionalLabel: UILabel!
    @IBOutlet weak var companyOverviewLabel: UILabel!
    @IBOutlet weak var workLocationLabel: UILabel!
    @IBOutlet weak var addInfoLabel: UILabel!
    
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
        
        // job desc and qualification
        jobDescriptionLabel.text = """
        Job Desc : \n\(data?.jobsDescription ?? "")\n\n
        Qualification : \n\(data?.jobsQualification ?? "")
        """
        
        // join us
        joinUSLabel.text = data?.joinUS ?? ""
        
        // additional information
        additionalLabel.text = """
        Position Level \n\(data?.jobsPosition ?? "")\n
        Years of Experience \n\(data?.jobsExperience ?? 0) years\n
        Employment Type \n\(data?.jobsType ?? "")\n
        Specializations \n\(data?.jobsSpecializations ?? "")
        """
        companyOverviewLabel.text = data?.companyOverview ?? ""
        
        // work location
        workLocationLabel.text = """
        Address \n\(data?.jobsLocation ?? "")
        """
        
        // addtional company information
        addInfoLabel.text = """
        Benefits & Others \n\(data?.jobsBenefit ?? "")\n
        Company Size \n\(data?.companySize ?? "0") Employees
        """
        
    }
    
    private func loadSegmentControl(){
        segmentControl.setTitle("Job Description", forSegmentAt: 0)
        segmentControl.setTitle("Company Overview", forSegmentAt: 1)
        segmentControl.selectedSegmentIndex = 0
    }
    
    @IBAction func segmentControlPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            myScroolview.scrollRectToVisible(viewDescription.frame, animated: true)
        case 1:
            myScroolview.scrollRectToVisible(viewCompanyOverview.frame, animated: true)
        default:
            print("Scrool Error")
        }
    }
    
}
