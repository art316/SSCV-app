//
//  EducationTableViewCell.swift
//  SSCV
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import UIKit

class EducationTableViewCell: UITableViewCell, InfoProfileCellConfiguration {
    
    @IBOutlet weak var customBackGroundView: UIView!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.customBackGroundView.backgroundColor = UIColor.globantBlue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setConfigurationFrom(_ item: Any) {
        if let education = item as? Education{
            self.setEducationValues(education)
        }
    }
    
    func setEducationValues(_ education: Education){
        self.universityLabel.text = education.universityName
        self.locationLabel.text = education.locationText()
        self.periodLabel.text = education.periodText()
        self.degreeLabel.text = education.collegeDegree
    }
    
}
