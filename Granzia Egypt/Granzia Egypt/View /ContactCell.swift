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
    
    func setContct(contact: Contact){
        nameLable.text = contact.name
        numberLable.text = contact.number
    }
    
    @IBAction func makePhoneCall(_ sender: UIButton) {
         print("------------ Phone call to \(numberLable.text!)------------")
         guard let number = numberLable.text , let url = URL(string: "telprompt://\(number)") else {return}
         UIApplication.shared.open(url, options: [:], completionHandler: nil)
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
