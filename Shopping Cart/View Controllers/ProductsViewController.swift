import UIKit
import Kingfisher

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
        
//        let cartItem = cart.item(for: product)
        
        cell.delegate = self
        configure(cell: cell, with: product)
        
        return cell
    }
    
//    private static let quantityFormatter: NumberFormatter = {
//        NumberFormatter()
//    }()
//
    
    private func configure(cell: ProductTableViewCell, with product: Product) {
        cell.mainImageView.kf.cancelDownloadTask()
        cell.mainImageView.image = nil
        cell.mainImageView.kf.setImage(with: product.images.first?.url)
        
        cell.nameLabel.text = product.title
        cell.priceLabel.text = ProductTableViewCell.currencyFormatter.string(for: product.price.value)
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
