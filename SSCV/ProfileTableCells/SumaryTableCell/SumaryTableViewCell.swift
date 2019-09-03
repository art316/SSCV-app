//
//  SumaryTableViewCell.swift
//  SSCV
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import UIKit

class SumaryTableViewCell: UITableViewCell, InfoProfileCellConfiguration {

    @IBOutlet weak var customBackGroundView: UIView!
    @IBOutlet weak var textView: UITextView!
    var sumarryText = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customBackGroundView.backgroundColor = UIColor.globantBlue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setAttributtedText(_ attributedText: NSAttributedString){
        self.textView.attributedText = attributedText
    }
    
    func setText(_ text: String) {
            self.textView.text = text
    }
    
    func setConfigurationFrom(_ item: Any) {
        if let attributedText = item as? NSAttributedString{
            self.setAttributtedText(attributedText)
        }else if let text =  item as? String{
            self.setText(text)
        }
    }
    
    static func calculateHeightRowFrom(text: String, in width: CGFloat) -> CGSize{
        let size = CGSize(width: width, height: 1000)
        let options = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        var estimateRect = NSString.init(string:  text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: options, context: nil)
        estimateRect = CGRect.init(x: estimateRect.origin.x, y: estimateRect.origin.y, width: estimateRect.width, height: estimateRect.height+8+20)
        return estimateRect.size
    }
    static func calculateHeightRowFrom(text: NSAttributedString, in width: CGFloat) -> CGSize{
        let size = CGSize(width: width, height: 1000)
        var estimateRect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, context: nil)
        estimateRect = CGRect.init(x: estimateRect.origin.x, y: estimateRect.origin.y, width: estimateRect.width, height: estimateRect.height+8+20)
        return estimateRect.size
    }
    
}
