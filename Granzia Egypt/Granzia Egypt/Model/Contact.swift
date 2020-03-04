//
//  Contact.swift
//  Granzia Egypt
//
//  Created by Mohammed Mohsin Sayed on 3/2/20.
//  Copyright © 2020 Abeer . All rights reserved.
//

import Foundation

class Contact {
    private var _name : String
    private var _number : String
    
    init(name: String, number: String) {
        self._name = name
        self._number = number
    }
    var name : String {
        return _name
    }
    var number : String {
        return _number
    }
}
