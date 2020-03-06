//
//  adsCell.swift
//  Granzia Egypt
//
//  Created by Mohammed Mohsin Sayed on 3/5/20.
//  Copyright © 2020 Abeer . All rights reserved.
//

import UIKit

class AdsCell: UICollectionViewCell {
    
    @IBOutlet weak var adImage: UIImageView!
    
    func setImage(image: UIImage){
        adImage.image = image
    }
}
