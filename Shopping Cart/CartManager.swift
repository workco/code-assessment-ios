//
//  CartManager.swift
//  Shopping Cart
//
//  Created by Vadym Apostolyuk on 10/18/19.
//  Copyright © 2019 Work & Co. All rights reserved.
//

import Foundation

protocol Cart {
    func addToCart()
    func removeFromCart()
    func updateQuantity()
}

class CartManager {
    
    static let shared = CartManager()
    
    var cartItems: [Product]?
    
}
