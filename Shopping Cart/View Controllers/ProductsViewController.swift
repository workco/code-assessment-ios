//
//  ProductsViewController.swift
//  Shopping Cart
//
//  Created by Nick Lee on 10/9/19.
//  Copyright © 2019 Work & Co. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product] {
        return [Product(name: "AirPods", price: 199.99, image: nil),
                Product(name: "iMac Pro", price: 5999.99, image: nil),
                Product(name: " Car", price: 99999.99, image: nil)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        cell.addToCartButton.tag = indexPath.row
        cell.configure(with: products[indexPath.row])
        
        return cell
    }
}

extension ProductsViewController: AddToCartButtonDelegate {
    func didTapAddToCartButton(_ tag: Int) {
        print("Selected row: \(tag)")
    }
}
