//
//  ContactUsVC.swift
//  Granzia Egypt
//
//  Created by Mohammed Mohsin Sayed on 3/2/20.
//  Copyright © 2020 Abeer . All rights reserved.
//

import UIKit

class ContactUsVC: UIViewController {

    @IBOutlet weak var customerServiceTableView: UITableView!
    @IBOutlet weak var distributersTableView: UITableView!
    
    var CSContacts = [Contact]()
    var DContacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerServiceTableView .delegate = self
        customerServiceTableView.dataSource = self
        
        distributersTableView.delegate =  self
        distributersTableView.dataSource = self
        
        DataServices.instance.getContacts { (distributers, customerService) in
            self.CSContacts = customerService
            self.DContacts = distributers
            self.customerServiceTableView.reloadData()
            self.distributersTableView.reloadData()
        }
    }
  
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
extension ContactUsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == customerServiceTableView {
            return CSContacts.count
        }else {
            return DContacts.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == customerServiceTableView {
            guard let cell = customerServiceTableView.dequeueReusableCell(withIdentifier: "CSCell") as? ContactCell else {return UITableViewCell()}
            let contact = CSContacts[indexPath.row]
            cell.setContct(contact: contact)
            return cell
        }else {
            guard let cell = distributersTableView.dequeueReusableCell(withIdentifier: "DCell") as? ContactCell else {return UITableViewCell()}
            let contact = DContacts[indexPath.row]
            cell.setContct(contact: contact)
            return cell
        }
    }
    
    
}
