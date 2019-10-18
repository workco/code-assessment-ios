//
//  CartViewController.swift
//  Shopping Cart
//
//  Created by Vadym Apostolyuk on 10/9/19.
//  Copyright © 2019 Work & Co. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    let manager: CartManager = CartManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let addedItemCount = manager.cartItems?.count {
            return addedItemCount
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
