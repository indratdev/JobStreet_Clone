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
    let jobM = JobsManager()
    var detailID: Int? = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var a = jobM.getNumberIndex(id: detailID!)

        print("ini id nya : \(a)")
    }
    
    

   

}
