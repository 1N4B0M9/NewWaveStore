//
//  SettingsView.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 2/14/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
struct SettingsView: View {
    @EnvironmentObject var userInfo : UserInfo
    @Binding var viewState : ViewState
    @State var showSheet : Bool = false
    var body: some View {
        VStack {
        Image(uiImage: userInfo.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200, alignment: .center)
            .clipShape(Circle())
            Button {
                showSheet = true
                
            } label : {
                Text("Change Image")
                    .font(Constants.buttonFont)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .foregroundColor(Color.highlight)
                    .cornerRadius(20)
            }.padding()
        Spacer()
        Button {
            try! Auth.auth().signOut()
            viewState = .authentication
            userInfo.loggedIn = false
            
        } label : {
            Text("Sign Out")
                .font(Constants.buttonFont)
                .frame(width: 300, height: 50)
                .background(Color.white)
                .foregroundColor(Color.highlight)
                .cornerRadius(20)
        }.padding()
        }
        .sheet(isPresented: $showSheet){
            //get user id
            guard let uid = Auth.auth().currentUser?.uid else {return}
            //compress and convert to data
            guard let imageData = userInfo.image.jpegData(compressionQuality: 0.25) else {return}
            //get a reference to the storage object
            let storage = Storage.storage().reference().child("users\(uid)")
            
            //save the image in firebase storage
            storage.putData(imageData) { meta , error in
                storage.downloadURL { url, error in
                    if let url = url{
                        self.userInfo.imageURL = url.absoluteString
                        let database = Database.database().reference().child("users/\(uid)")
                        database.setValue(userInfo.dictionary)
                    }
                }
                
            }
        } content: {
            ImagePicker(selectedImage: $userInfo.image)
        }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewState: Binding.constant(.list))
    }
}
