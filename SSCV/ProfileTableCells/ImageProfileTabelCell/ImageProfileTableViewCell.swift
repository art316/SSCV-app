//
//  ImageProfileTableViewCell.swift
//  SSCV
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import UIKit

class ImageProfileTableViewCell: UITableViewCell, InfoProfileCellConfiguration {

    @IBOutlet weak var profileImageView: UIImageView!
    private var profileImage : UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImageView.layer.cornerRadius =  self.profileImageView.frame.height/2
        self.profileImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setConfigurationFrom(_ item: Any) {
        if let imageUrl = item as? String{
            self.setImageFromUrlString(imageUrl)
        }
    }
    
    func setImageFromUrlString(_ urlString: String){
        if self.profileImage != nil{
            self.profileImageView?.image = self.profileImage
            return
        }
        
        if let url = URL.init(string: urlString), let data =  try? Data.init(contentsOf: url), let image = UIImage.init(data: data){
            self.profileImage = image
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.5, animations: {
                    self.profileImageView?.image = self.profileImage
                })
            }
        }
    }
    
}
