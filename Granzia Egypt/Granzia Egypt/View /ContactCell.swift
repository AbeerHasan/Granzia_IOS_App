//
//  ContactCell.swift
//  Granzia Egypt
//
//  Created by Mohammed Mohsin Sayed on 3/2/20.
//  Copyright © 2020 Abeer . All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var numberLable: UILabel!
    @IBOutlet weak var callBtn: UIButton!
    
    
    func setContct(contact: Contact){
        nameLable.text = contact.name
        numberLable.text = contact.number
    }
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    */
}
