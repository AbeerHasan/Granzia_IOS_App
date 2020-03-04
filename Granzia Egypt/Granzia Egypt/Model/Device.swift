//
//  File.swift
//  Granzia Egypt
//
//  Created by Abeer  on 8/11/18.
//  Copyright © 2018 Abeer . All rights reserved.
//

import Foundation
import UIKit

class Device {
    
     var image : UIImage
     var name : String
     var description : [String]
     var price : String
    
    init(Image : UIImage , name: String , Description : [String], price: String) {
        self.image = Image
        self.name = name
        self.description = Description
        self.price = price
    }
    
   
    
    
}
