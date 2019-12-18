import UIKit

final class ProductsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let dataService: DataService = .shared
    private let cart: Cart = .shared
    private var products: [Product]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        products = dataService.fetchDailyDeals()
        
        dump(products)
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
