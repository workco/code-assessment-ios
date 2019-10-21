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
    
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        products = [Product(name: "AirPods", price: 199.99, image: nil, quantity: 10),
        Product(name: "iMac Pro", price: 5999.99, image: nil, quantity: 5),
        Product(name: " Car", price: 99999.99, image: nil, quantity: 2)]
    }
}

extension ProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductTableViewCell, let item = products?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        cell.addToCartButton.tag = indexPath.row
        cell.configure(with: item)
        
        return cell
    }
}

extension ProductsViewController: AddToCartButtonDelegate {
    func didTapAddToCartButton(_ tag: Int) {
        updateProductList(with: tag)
    }
    
    private func updateProductList(with tag: Int) {
        guard var item = products?[tag] else { return }
        item.quantity -= 1
        products?[tag] = item
        
        let indexPath = IndexPath(item: tag, section: 0)
        tableView.reloadRows(at: [indexPath], with: .middle)
    }
}
