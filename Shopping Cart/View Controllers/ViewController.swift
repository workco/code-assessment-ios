//
//  ViewController.swift
//  Shopping Cart
//
//  Created by Nick Lee on 10/9/19.
//  Copyright © 2019 Work & Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Uh-Oh", message: "You need to implement add to cart functionality!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        
        cell.textLabel?.text = "Product Title"
        cell.detailTextLabel?.text = "Product Price"
        
        return cell
    }
}
