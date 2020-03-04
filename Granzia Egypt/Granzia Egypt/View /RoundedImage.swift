//
//  RoundedImage.swift
//  Granzia Egypt
//
//  Created by Mohammed Mohsin Sayed on 2/29/20.
//  Copyright © 2020 Abeer . All rights reserved.
//

import UIKit
@IBDesignable

class RoundedImage: UIImageView {

    @IBInspectable var cornerRadius : CGFloat = 100.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() { // to make the design appears at run time
        self.setUpView()
    }
    override func prepareForInterfaceBuilder() { // to make the design appears on the storyboard
        super.prepareForInterfaceBuilder()
        self.setUpView()
    }
    
    func setUpView(){
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    

}
