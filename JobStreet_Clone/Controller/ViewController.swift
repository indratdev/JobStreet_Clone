//
//  ViewController.swift
//  JobStreet_Clone
//
//  Created by IndratS on 17/10/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let util = Utilities()
    let jobsManager = JobsManager()
    lazy var idItem: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        load()
//        tabbarnya()
//        deleteAllData("Jobs")
        
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
                controller.detailID = self.idItem
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
        return CGFloat(util.jobsTVCellHeight)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = jobsManager.allJobs[indexPath.row].id
        self.idItem = id
        performSegue(withIdentifier: util.detailSegue, sender: indexPath)
    }
    
}


extension ViewController {
   
    func deleteAllData(_ entity:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
}
