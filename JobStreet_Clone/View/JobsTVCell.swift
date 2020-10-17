//
//  JobsTVCell.swift
//  JobStreet_Clone
//
//  Created by IndratS on 17/10/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit

class JobsTVCell: UITableViewCell {
    @IBOutlet weak var jobsName: UILabel!
    @IBOutlet weak var jobsCompanyLabel: UILabel!
    @IBOutlet weak var jobsLocationLabel: UILabel!
    @IBOutlet weak var jobsSalaryLabel: UILabel!
    @IBOutlet weak var jobsTimeLabel: UILabel!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var logoJobs: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLayout(){
        myView.layer.cornerRadius = 10
    }
    
}
