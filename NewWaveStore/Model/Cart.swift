//
//  Cart.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 12/1/22.
//

import Foundation
import SwiftUI

class Cart : ObservableObject {
    var products : ProductList = ProductList(prodList: [])
    @Published var id : UUID = UUID()
    var total : Double {
        var sum : Double = 0.0
        
        for i in products.prodList {
            sum = sum + i.price * Double(i.quant)
        }
        return sum

        
    }
    
    func addProduct(_ product : Product){
        var found : Bool = false
        
        for p in products.prodList{
            if p == product {
                found = true
                p.quant += 1
                
            }
        }
        if !found{
            products.prodList.append(product)
        }
        id = UUID()
        
    
    }
}
