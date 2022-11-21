//
//  Product.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 11/21/22.
//

import SwiftUI

class Product {
    var name : String
    var description : String
    var pic : String
    var quant : Int
    var price : Double
    init(name : String = "", description : String = "", pic : String = "", quant : Int = 0, price : Double = 0 ){
        self.name = name
        self.description = description
        self.pic = pic
        self.quant = quant
        self.price = price
        
        
    }
    
    
}
