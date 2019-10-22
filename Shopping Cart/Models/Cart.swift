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
    
    var cartItems: [Product] = []
    
    func addToCart(_ product: Product) {
        let filteredItems = cartItems.filter { $0 == product }
        
        if var item = filteredItems.first {
            item.quantity += 1
        } else {
            cartItems.append(product)
        }
    }
    
    func removeFromCart(_ product: Product) {
        
    }
    
    func updateCart(with product: Product) {
        if self.contains(product) {

        } else {

        }
    }
}

extension Cart {
    func contains(_ product: Product) -> Bool {
        let item = cartItems.filter { $0.self == product }
        return item.first != nil
    }
}
