//
//  Cart.swift
//  Shopping Cart
//
//  Created by Vadym Apostolyuk on 10/21/19.
//  Copyright © 2019 Work & Co. All rights reserved.
//

import Foundation

class Cart {
    static let shared = Cart()
    var items: [Product] = []
    
    func addToCart(_ product: Product) {
        items.append(product)
    }
    
    func removeFromCart(_ product: Product) {
        
    }
    
    func updateCart(with item: Product) {
        item.quantity += 1
    }
    
    func totalCost() -> Double {
        let total = items.map({ $0.subtotal }).reduce(0, +)
        return round(100.0 * total) / 100.0
    }
}
