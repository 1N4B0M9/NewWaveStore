//
//  ProductList.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 11/21/22.
//

import Foundation
class ProductList : ObservableObject {
    
    @Published var prodList : [Product]
    init(prodList : [Product] = [Product(name: "WPhone", description: "Best phone", pic: "nwPhone", quant: 100, price: 200.0), Product(name: "Wpen", description: "Best Pen", pic: "wPen", quant: 1000, price: 20.0), Product(name: "Software", description: "Best software", pic: "software", quant: 100000, price: 10.0), Product() ]) {
        self.prodList = prodList
    }
}
