//
//  deviceCell.swift
//  Granzia Egypt
//
//  Created by Mohammed Mohsin Sayed on 2/28/20.
//  Copyright © 2020 Abeer . All rights reserved.
//

import UIKit

class DeviceCell: UICollectionViewCell {
    
    @IBOutlet weak var deviceImage: UIImageView!
    @IBOutlet weak var deviceName: UILabel!
    
    func setDeviceCell(image: UIImage, name: String){
        deviceImage.image = image
        deviceName.text = name
    }
}
