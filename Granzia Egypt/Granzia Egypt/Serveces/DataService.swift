
import Foundation
import Firebase

class DataServices {
    static let instance = DataServices()
    
    private var _REF_BASE = FIREBASE_BASE_URL
    private var _REF_USERS = FIREBASE_BASE_URL.child("users")
    private var _REF_CATEGORIES = FIREBASE_BASE_URL.child("Categories")
    private var _REF_ABOUT = FIREBASE_BASE_URL.child("About")
    private var _REF_CONTACT = FIREBASE_BASE_URL.child("Contacts")
    
    
    var REF_BASE :DatabaseReference {
        return _REF_BASE
    }
    var REF_USERS :DatabaseReference {
        return _REF_USERS
    }
    var REF_CATEGORIES :DatabaseReference {
        return _REF_CATEGORIES
    }
    var REF_ABOUT :DatabaseReference {
        return _REF_ABOUT
    }
    var REF_CONTACT :DatabaseReference {
        return _REF_CONTACT
    }
    
    private var selectedDevice : Device?
    func setSelectedDevice(device: Device){
        self.selectedDevice = device
    }
    var SELECTED_DEVICE : Device? {
        if selectedDevice != nil {
            return selectedDevice!
        }
        return nil
    }
    //---------------------------------------------------------
    func createDBUres(uid: String , userData: Dictionary<String , Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func getUserData(uId: String , handler: @escaping (_ userName: String , _ userEmail: String) -> ()){
        REF_USERS.observeSingleEvent(of: .value) { (usersSnapShot) in
            guard let usersSnapShot = usersSnapShot.children.allObjects as? [DataSnapshot] else {return}
            for user in usersSnapShot {
                if user.key == uId {
                    handler(user.childSnapshot(forPath: "name").value as! String, user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    func getAllCategories(handler: @escaping (_ Categories : [Category]) -> ()) {
        var categories = [Category]()
        REF_CATEGORIES.observeSingleEvent(of: .value) { (CategoriesSnapshot) in
            guard let categoriesSnapShot = CategoriesSnapshot.children.allObjects as? [DataSnapshot] else {return}
            
            for category in categoriesSnapShot {
                let name = category.childSnapshot(forPath: "Name").value as! String
                //print("**************** \(name) ")
                let pic = category.childSnapshot(forPath: "Picture").value as! String
                let picURL = URL(string: pic)
                let imageData:NSData = NSData(contentsOf: picURL!)!
                let image = UIImage(data: imageData as Data)
                //devices
                var products = [Device]()
                guard let productsSnapShot = category.childSnapshot(forPath: "Products").children.allObjects as? [DataSnapshot] else {return}
                
                for product in  productsSnapShot{
                    let _Name = product.childSnapshot(forPath: "Name").value as! String
                    let _price = product.childSnapshot(forPath: "Price").value as! String
                    let _pic = product.childSnapshot(forPath: "Picture").value as! String
                    let _description = product.childSnapshot(forPath: "Description").value as! [String]
                    //image preparation
                    let _picURL = URL(string: _pic)
                    let _imageData:NSData = NSData(contentsOf: _picURL!)!
                    let _image = UIImage(data: _imageData as Data)
                 
                    let device = Device(Image: _image!, name: _Name, Description: _description, price: _price)
                    products.append(device)
                }
                let category_ = Category(id: category.key,name: name, devices: products, picture: image!)
                categories.append(category_)
                handler(categories)
            }
        }
    }
    func getContacts(handler : @escaping (_ Distributors: [Contact], _ CustomerServices: [Contact]) -> ()){
        var distributors = [Contact]()
        var customerServices = [Contact]()
        
        let contactType = ["Customer Service","Distributor"]
        
        for Type in contactType {
            REF_CONTACT.child(Type).observeSingleEvent(of: .value) { (ContactSnapShot) in
                guard let contactSS = ContactSnapShot.children.allObjects as? [DataSnapshot] else {return}
                
                for contact in contactSS {
                    let name = contact.childSnapshot(forPath: "name").value as! String
                    let number = contact.childSnapshot(forPath: "number").value as! String
                    
                    let _contact = Contact(name: name, number: number)
                    if Type == "Customer Service"{
                        customerServices.append(_contact)
                    }else {
                        distributors.append(_contact)
                    }
                }
                handler(distributors,customerServices)
            }
        }
        
    }
}
