//
//  DetailJobsVC.swift
//  JobStreet_Clone
//
//  Created by IndratS on 17/10/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit
import CoreData

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
    @IBOutlet weak var saveBtn: UIButton!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let jobM = JobsManager()
    var detailID: Int? = 0
    var data: JobsModel?
    var jobSaved: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = jobM.getNumberIndex(id: detailID!)
        loadUI()
        reloadMyData()
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
        
        buttonColor(id: data?.id ?? 0)
        
    }
    
    private func buttonColor(id: Int){
        if let exist = data?.id {
            if someEntityExists(id: exist){
                saveBtn.backgroundColor = .orange
                saveBtn.setTitle("Unsaved", for: .normal)
            }else{
                saveBtn.backgroundColor = .clear
                saveBtn.setTitle("Saved", for: .normal)
            }
        }
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
    
    @IBAction func savePressed(_ sender: UIButton) {
        guard let id = data?.id else { return }
        print("id : \(id)")
        //        savedJob(myIDJob: id)
        let exist = someEntityExists(id: id)
        print("data pada id : \(id) \(exist)")
        if exist {
            print("----- proses hapus savedjobs -----")
            let fetchRequest: NSFetchRequest<Jobs> = Jobs.fetchRequest()
            fetchRequest.predicate = NSPredicate.init(format: "id_jobs == %ld", id) //(format: "id_jobs == %ld \(id)")
            let objects = try! context.fetch(fetchRequest)
            for obj in objects {
                context.delete(obj)
                print("delete id: \(id) berhasil")
            }
            
            do {
                try context.save() // <- remember to put this :)
                print("saving new")
            } catch {
                // Do something... fatalerror
                print("error save")
            }
            print("------ end proses hapus ---------------------")
        }else{
            savedJob(myIDJob: id)
        }
        
        buttonColor(id: id)
    }
    
    
}

extension DetailJobsVC {
    func reloadMyData(){
        let request = Jobs.fetchRequest() as NSFetchRequest<Jobs>
        // sorting
        let sort = NSSortDescriptor(key: "id_jobs", ascending: true)
        request.sortDescriptors = [sort]
        
        do {
            let jobs: [Jobs]?
            jobs = try context.fetch(request)
            //print(jobs?[1].id_jobs)
            
            //reload table view nya
            //            DispatchQueue.main.async {
            //                self.myTableView.reloadData()
            //            }
            
        }catch{
            print("Error reload my data")
        }
        
    }
    
    func someEntityExists(id: Int) -> Bool {
        var final:Bool = false
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Jobs")
        let predicate = NSPredicate(format: "id_jobs == %ld", id)
        request.predicate = predicate
        request.fetchLimit = 1
        do {
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            let count = try context.count(for: request)
            if (count == 0){
                print("tidak ada data")
                final = false
            }else{
                print("sudah ada datanya")
                final = true
            }
            
        }catch let err{
            print(err)
        }
        
        return final
    }
    
    func savedJob(myIDJob: Int){
        // referensi ke appdelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        //referensi entitry yg elah dibuat sebelumnya
        guard let userEntity = NSEntityDescription.entity(forEntityName: "Jobs", in: managedContext) else {return}
        
        // entitry body
        let insert = NSManagedObject(entity: userEntity, insertInto: managedContext)
        insert.setValue(myIDJob, forKey: "id_jobs")
        insert.setValue(1, forKey: "actived")
        
        do {
            try managedContext.save()
            print("Data id: \(myIDJob) berhasil di simpan")
        }catch let err {
            print(err)
        }
    }
}
