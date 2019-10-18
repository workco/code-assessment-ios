//
//  ProductTableViewCell.swift
//  Shopping Cart
//
//  Created by Vadym Apostolyuk on 10/17/19.
//  Copyright © 2019 Work & Co. All rights reserved.
//

import UIKit

protocol AddToCartButtonDelegate: class {
    func didTapAddToCartButton(_ tag: Int)
}

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    weak var delegate: AddToCartButtonDelegate?
    
    func configure(with product: Product) {
        productNameLabel.text = product.name
        productPriceLabel.text = "$ \(product.price)"
    }
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
        delegate?.didTapAddToCartButton(sender.tag)
    }
    
}
