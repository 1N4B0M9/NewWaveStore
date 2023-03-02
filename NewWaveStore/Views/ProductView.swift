//
//  ProductView.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 11/23/22.
//

import SwiftUI

struct ProductView: View {
    @Binding var pro : Product
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.highlight)
                .cornerRadius(10)
                .frame(width: 300, height: 150)
           HStack {
               Image(pro.pic)
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 100, height: 100)
        
                VStack{
                    Text(pro.name)
                        .foregroundColor(Color.white)
                    Text(String(format: "$%.2f", pro.price))
                        .foregroundColor(Color.white)
                }
            }
            
        }

    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(pro: Binding.constant(Product()))
    }
}
