//
//  AuthService.swift
//  Granzia Egypt
//
//  Created by Mohammed Mohsin Sayed on 2/28/20.
//  Copyright © 2020 Abeer . All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    
    func registerUser(name: String, email: String, password: String, completion: @escaping (_ status: Bool , _ error: Error?) -> () ){
        
        let lowerCassEmail = email.lowercased()
        
        Auth.auth().createUser(withEmail: lowerCassEmail, password: password) { (user, error) in
            guard let user = user  else {
                completion(false,error)
                return
            }
            
            let userData: [String: Any] = [
                "email" : user.user.email!,
                "name" : name,
                "provider" : user.user.providerID
            ]
            DataServices.instance.createDBUres(uid: user.user.uid, userData: userData)
            completion(true,nil)
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping  (_ status: Bool , _ error: Error?) -> () ){
        
        let lowerCassEmail = email.lowercased()
        
        Auth.auth().signIn(withEmail: lowerCassEmail, password: password) { (user, error) in
            guard let user = user  else {
                completion(false,error)
                return
            }
            
            let userData: [String: Any] = [
                "provider" : user.user.providerID,
                "email" : user.user.email!
            ]
            DataServices.instance.createDBUres(uid: user.user.uid, userData: userData)
            completion(true,nil)
        }
        
    }
}
