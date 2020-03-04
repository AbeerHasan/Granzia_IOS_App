//
//  medicalDevicesList.swift
//  Granzia Egypt
//
//  Created by Abeer  on 8/11/18.
//  Copyright © 2018 Abeer . All rights reserved.
//

import UIKit


class medicalDevicesList: UIViewController {
	
	@IBOutlet weak var categoriesTableView: UITableView!
	
	var categories = [Category]()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		categoriesTableView.delegate = self
		categoriesTableView.dataSource = self
		
		DataServices.instance.getAllCategories { (Categories) in
			self.categories = Categories
			self.categoriesTableView.reloadData()
		}
		
	}

	}

extension medicalDevicesList: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return categories.count
	}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryCell
		let category = categories[indexPath.row]
		cell.setCategory(category: category)
		return cell
    }
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 205
	}
}





















