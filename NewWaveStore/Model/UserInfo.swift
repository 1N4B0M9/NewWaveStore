//
//  UserInfo.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 2/6/23.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
class UserInfo : ObservableObject{
    @Published var username : String
    @Published var password : String
    @Published var loggedIn : Bool = false
    @Published var image : UIImage = UIImage(named: "Person")!
    @Published var imageURL : String
    @Published var address : String
    var dictionary: [String : Any] {
        ["image": imageURL, "address" : address]
    }
    init(username : String = "", password : String = "") {
        self.username = username
        self.password = password
        self.imageURL = ""
        self.address = ""
        Auth.auth().addStateDidChangeListener {_, user in
            guard let user = user  else {return}
            self.username = user.email ?? ""
            self.loggedIn = true
           
        }
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        Database.database().reference().child("users/\(uid)").observeSingleEvent(of : .value)
            { snapshot in
                let dictionary = snapshot.value as? [String : AnyObject] ?? [:]
                guard let url = dictionary["image"] else {return}
                self.imageURL = dictionary["image"] as! String ?? self.imageURL
                Storage.storage().reference(forURL : url as! String).getData(maxSize: 1*2048*2048) { data, error in
                    if let data = data {
                        self.image = UIImage(data: data) ?? self.image
                    } else {
                        print(error?.localizedDescription)
                    }
                }
        }
    }
    
}
