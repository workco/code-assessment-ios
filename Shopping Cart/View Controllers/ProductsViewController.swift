import UIKit

final class ProductsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var products: [Product]?
    private let cart: Cart = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = [
            Product(id: 0, name: "AirPods", price: 199.99, imageURL: nil, stock: 10),
            Product(id: 1, name: "iMac Pro", price: 5999.99, imageURL: nil, stock: 5),
            Product(id: 2, name: " Car", price: 99999.99, imageURL: nil, stock: 2)
        ]
    }
}

extension ProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductTableViewCell,
            let product = products?[indexPath.row] else {
                return UITableViewCell()
        }
        
        let cartItem = cart.item(for: product)
        cell.configure(with: product, cartItem: cartItem)
        cell.delegate = self
        
        return cell
    }
}

extension ProductsViewController: ProductTableViewCellDelegate {
    func didTapAddToCartButton(cell: ProductTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell), let product = products?[indexPath.row] else {
            return
        }
        cart.add(product)
        tableView.reloadRows(at: [indexPath], with: .middle)
    }
}
