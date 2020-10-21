//
//  ViewController.swift
//  JobStreet_Clone
//
//  Created by IndratS on 17/10/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    let util = Utilities()
    let jobsManager = JobsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        load()
        
    }
    
    func load(){
        myTableView.delegate = self
        myTableView.dataSource = self
        
        let uib = UINib(nibName: "JobsTVCell", bundle: nil)
        myTableView.register(uib, forCellReuseIdentifier: util.JobsCell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == util.detailSegue){
            if let controller = segue.destination as? DetailJobsVC {
                
            }
        }
    }
    
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobsManager.allJobs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: util.JobsCell , for: indexPath) as! JobsTVCell
        let jobs = jobsManager.allJobs[indexPath.row]
        let logo = jobs.jobsCompanyLogo
        
        cell.jobsName.text = jobs.jobsName
        cell.jobsCompanyLabel.text = jobs.jobsCompany
        cell.jobsLocationLabel.text = jobs.jobsLocation
        cell.jobsSalaryLabel.text = jobs.jobsSalary
        cell.logoJobs.image = UIImage(named: logo ?? "no image")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 193
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = jobsManager.allJobs[indexPath.row].id
        print(id)
        performSegue(withIdentifier: util.detailSegue, sender: indexPath)
    }
    
}