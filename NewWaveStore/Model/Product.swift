//
//  Product.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 11/21/22.
//

import SwiftUI

class Product : ObservableObject{
    @Published var name : String
    @Published var description : String
    @Published var pic : String
    @Published var quant : Int
    @Published var price : Double
    init(name : String = "NW-PC", description : String = "BEST COMPUTER", pic : String = "NW-PC", quant : Int = 100, price : Double = 1000.0 ){
        self.name = name
        self.description = description
        self.pic = pic
        self.quant = quant
        self.price = price
        
        
    }
    
    
}
