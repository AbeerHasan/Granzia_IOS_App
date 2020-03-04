//
//  RoundedButton.swift
//  Granzia Egypt
//
//  Created by Mohammed Mohsin Sayed on 2/29/20.
//  Copyright © 2020 Abeer . All rights reserved.
//

import UIKit

@IBDesignable

class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius : CGFloat = 20.0 {
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
    }
    
    
}
