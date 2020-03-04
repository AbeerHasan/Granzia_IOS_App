

import Foundation
import UIKit

class Category {
    private var _name : String
    private var _devices : [Device]?
    private var _picture : UIImage
    private var _id : String
    
    init(id: String ,name: String, devices: [Device]?, picture: UIImage ) {
        self._id = id
        self._name = name
        self._devices = devices
        self._picture = picture
    }
    var id : String {
        return _id
    }
    var name : String {
        return _name
    }
    var devices : [Device]? {
        if _devices != nil {
            return _devices!
        }
        return nil
    }
    var picture : UIImage {
        return _picture
    }
    
    func setDevices(devices: [Device]){
        self._devices = devices
    }
    
}
