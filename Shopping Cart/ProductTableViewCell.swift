//
//  ProductTableViewCell.swift
//  Shopping Cart
//
//  Created by Vadym Apostolyuk on 10/17/19.
//  Copyright © 2019 Work & Co. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    func configure(with product: Product) {
        productNameLabel.text = product.name
        productPriceLabel.text = product.price
    }
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
        print("Product added!")
    }
    
}
