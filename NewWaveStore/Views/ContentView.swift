//
//  ContentView.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 11/21/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var prolist : ProductList
    @EnvironmentObject var userInfo : UserInfo
    @State var viewState : ViewState = .authentication
    @State var index : Int = 0
    var body: some View {
        if viewState == .authentication && !userInfo.loggedIn {
            AuthenticationView(viewState: $viewState)
        }
        else if viewState == .login && !userInfo.loggedIn{
            LoginView( viewState: $viewState)
        }
        else if viewState == .signUp && !userInfo.loggedIn {
            SignUp( viewState: $viewState)
        }
        else if viewState == .forgotPassword {
            ForgotPassword(viewState: $viewState)
        }
        else {
        
        TabView {
            if viewState == .list {
                ProductListView(viewState: $viewState, index: $index)
                    .tabItem{
                        Image(systemName: "house")
                        Text("store")
                    }
                
            }
            else {
                ProductDetailView(pro: $prolist.prodList[index], viewState: $viewState)
                    .tabItem{
                        Image(systemName: "house")
                        Text("store")
                    }
                
            }
            CartView()
                .tabItem{
                    Image(systemName: "cart")
                    Text("Cart")
                }
            SettingsView(viewState: $viewState)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
        }.accentColor(Color.highlight)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProductList())
            .environmentObject(Cart())
    }
}
