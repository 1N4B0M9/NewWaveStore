//
//  ProductListView.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 11/23/22.
//

import SwiftUI
import FirebaseAuth
struct ProductListView: View {
    @EnvironmentObject var prolist : ProductList
    @EnvironmentObject var userInfo : UserInfo
    @Binding var viewState : ViewState
    @Binding var index : Int
    var body: some View {
        
        VStack{
            ScrollView{
                ForEach(prolist.prodList.indices) { i in
                    ProductView(pro : $prolist.prodList[i])
                        .onTapGesture {
                            viewState = .detail
                            index = i
                        }

                
            }
               
            
                /*
            NavigationView {
                List {
                    ForEach(prolist.prodList.indices) { i in
                        
                        NavigationLink {
                            
                            
                            
                        } label: {
                            ProductView(pro : $prolist.prodList[i])
                            
                        }
                    }
                }
            }
                */
        }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(viewState: Binding.constant(.detail), index: Binding.constant(0))
            .environmentObject(ProductList())
    }
}
