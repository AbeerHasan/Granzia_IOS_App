//
//  AboutVC.swift
//  Granzia Egypt
//
//  Created by Mohammed Mohsin Sayed on 3/5/20.
//  Copyright © 2020 Abeer . All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func getFacebookPage(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.facebook.com/GRANZIA/")! as URL, options: [:], completionHandler: nil)
    }
    
}
