//
//  NewWaveStoreApp.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 11/21/22.
//

import SwiftUI
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@main
struct NewWaveStoreApp: App {
    
    @StateObject var prolist : ProductList = ProductList()
    @StateObject var cart : Cart = Cart()
    @StateObject var userInfo : UserInfo = UserInfo()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
           ContentView()
                .environmentObject(prolist)
                .environmentObject(cart)
                .environmentObject(userInfo)
            
        }
    }
}
