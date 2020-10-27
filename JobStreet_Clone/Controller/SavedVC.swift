//
//  SavedVC.swift
//  JobStreet_Clone
//
//  Created by IndratS on 24/10/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit
import CoreData

class SavedVC: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let util = Utilities()
    let jobManager = JobsManager()
    var job: [Jobs]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        let uib = UINib(nibName: "JobsTVCell", bundle: nil)
        myTableView.register(uib, forCellReuseIdentifier: util.JobsCell)
        
        loadDataSaved()
    }
    
    func loadDataSaved(){
        let request = Jobs.fetchRequest() as NSFetchRequest<Jobs>
        let sort = NSSortDescriptor(key: "id_jobs", ascending: true)
        request.sortDescriptors = [sort]
        
        do{
            self.job = try context.fetch(request)
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
            
        }catch{
            print("Error reload data")
        }
    }
    
}

extension SavedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return job?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: util.JobsCell, for: indexPath) as! JobsTVCell
        let data = job?[indexPath.row]
        let id = data?.id_jobs
        let j = Int(exactly: id ?? 0)
        jobManager.getNumberIndex(id: j ?? 0)
        
        cell.jobsName.text = "\(j)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(util.jobsTVCellHeight)
    }
    
}
