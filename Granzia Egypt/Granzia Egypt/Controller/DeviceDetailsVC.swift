//
//  ViewController.swift
//  Granzia Egypt
//
//  Created by Abeer  on 8/11/18.
//  Copyright © 2018 Abeer . All rights reserved.
//

import UIKit

class DeviceDetailsVC: UIViewController{

    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var descriptionTableView: UITableView!
    
    var descriptions = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        nameLable.text = DataServices.instance.SELECTED_DEVICE?.name
        Image.image = DataServices.instance.SELECTED_DEVICE?.image
        priceLable.text = DataServices.instance.SELECTED_DEVICE?.price
        
        descriptionTableView.delegate = self
        descriptionTableView.dataSource = self
        
        descriptions = DataServices.instance.SELECTED_DEVICE!.description
        
        descriptionTableView.reloadData()
    }

    @IBAction func backPtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
extension DeviceDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = descriptionTableView.dequeueReusableCell(withIdentifier: "DescriptionCell") as?  DescriptionCell else {
             print("Error *************")
            return UITableViewCell()}
            cell.setDescriptionLine(content: descriptions[indexPath.row])
            return cell
       
    }
    
    
}
