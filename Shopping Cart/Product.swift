//
//  Product.swift
//  Shopping Cart
//
//  Created by Vadym Apostolyuk on 10/17/19.
//  Copyright © 2019 Work & Co. All rights reserved.
//

import Foundation

class Product: Equatable {
    let name: String
    let price: Double
    let image: String?
    var stock: Int
    var quantity: Int = 1
    var subtotal: Double {
        return price * Double(quantity)
    }
    
    init(name: String, price: Double, image: String?, stock: Int) {
        self.name = name
        self.price = price
        self.image = image
        self.stock = stock
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price && lhs.image == rhs.image && lhs.stock == rhs.stock
    }
}
