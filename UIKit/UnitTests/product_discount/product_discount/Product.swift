//
//  Product.swift
//  product_discount
//
//  Created by Jonathan Phouminh on 7/16/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import Foundation

class Product {
    var name: String?
    var price: Double?
    
    init(_ n: String, _ p: Double) {
        self.name = n
        self.price = p
    }
}

extension Product {
    func calculateDiscount(_ discountRate: Double) -> Double{
        let discountRate = self.price! * discountRate
        return self.price! - discountRate
    }
}


