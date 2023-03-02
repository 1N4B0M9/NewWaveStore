//
//  CartView.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 12/6/22.
//

import SwiftUI

struct CartView: View {
  
    @EnvironmentObject var cart : Cart
    var body: some View {
        VStack{
            ScrollView{
                ForEach($cart.products.prodList) { p in
                    //CartItemView(pro : $cart.products.prodList[i])
                        CartItemView(pro: p)
                        
            }
            }
            HStack {
                Text("Total")
                    .padding(.leading)
                Spacer()
                Text(String(format: "$%.2f", cart.total))
                    .padding(.trailing)

            }
           
    }
    }
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(Cart())
    }
}
