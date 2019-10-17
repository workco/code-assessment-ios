//
//  CartViewController.swift
//  Shopping Cart
//
//  Created by Vadym Apostolyuk on 10/9/19.
//  Copyright © 2019 Work & Co. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
