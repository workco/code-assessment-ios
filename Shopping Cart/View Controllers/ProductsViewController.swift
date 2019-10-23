import UIKit

final class ProductsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var products: [Product]?
    private let cart: Cart = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = [Product(name: "AirPods", price: 199.99, image: nil, stock: 10),
        Product(name: "iMac Pro", price: 5999.99, image: nil, stock: 5),
        Product(name: " Car", price: 99999.99, image: nil, stock: 2)]
    }
    
    fileprivate func updateCart(with tag: Int) {
        products?[tag].stock -= 1
        guard let product = products?[tag] else { return }
        
        if cart.items.contains(product) {
            cart.updateCart(with: product)
        } else {
            cart.addToCart(product)
        }
    
        let indexPath = IndexPath(item: tag, section: 0)
        tableView.reloadRows(at: [indexPath], with: .middle)
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
        updateCart(with: tag)
    }
}
