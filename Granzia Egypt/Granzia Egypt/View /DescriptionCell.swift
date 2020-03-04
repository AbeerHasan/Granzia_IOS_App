//
//  DescriptionCell.swift
//  Granzia Egypt
//
//  Created by Mohammed Mohsin Sayed on 2/29/20.
//  Copyright © 2020 Abeer . All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell {

    @IBOutlet weak var descriptionLineLabel: UILabel!
    
    func setDescriptionLine(content: String){
        descriptionLineLabel.text = "* \(content)"
        print("* \(content)")
    }
  /*  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   */
}
