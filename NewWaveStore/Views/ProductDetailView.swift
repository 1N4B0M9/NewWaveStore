//
//  ProductDetailView.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 11/29/22.
//

import SwiftUI

struct ProductDetailView: View {
    @Binding var pro : Product
    @Binding var viewState : ViewState
    @EnvironmentObject var cart : Cart
    var body: some View {
        
        VStack () {
            Button {
                viewState = .list
            } label : {
                Text("<< back")
            }
            Image(pro.pic)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: .center)
            Text(pro.name)
                .padding()
            Text(String(format: "$%.2f", pro.price))
                .padding()


            Text(pro.description)
                .padding()


            Text("Quantity Available \(pro.quant)")
                .padding()


            Spacer()
            Button {
                cart.addProduct(Product(name: pro.name, description: pro.description, pic: pro.pic, quant: 1, price: pro.price))
                pro.quant = pro.quant - 1

            } label: {
                Text("Add To Cart")
                    .padding(10)
                    .frame(width: 400, height:50)
                    .foregroundColor(Color.white)
                    .background(Color.highlight)
                    .cornerRadius(10)
                    
                
                    
            }
            

        }
            
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(pro: Binding.constant(Product()), viewState: Binding.constant(.list))
            .environmentObject(Cart())
    }
}
