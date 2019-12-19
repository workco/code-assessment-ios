import UIKit

final class CartViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private var emptyStateView: UIView!
    @IBOutlet private weak var footerView: UIView!
    @IBOutlet private weak var totalLabel: UILabel!
    @IBOutlet private weak var checkoutButton: UIButton!
    
    private let cart: Cart = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAppearanceForCartState()
    }
    
    private func updateAppearanceForCartState() {
        if cart.items.isEmpty {
            tableView.backgroundView = emptyStateView
            footerView.isHidden = true
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func checkoutButtonTapped(_ sender: UIButton) {
        cart.empty()
        dismiss(animated: true, completion: nil)
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? CartItemCell else {
            return UITableViewCell()
        }
        
        let item = cart.items[indexPath.row]
        configure(cell: cell, with: item)
        
        return cell
    }
    
    func configure(cell: CartItemCell, with item: CartItem) {
        cell.mainImageView.kf.cancelDownloadTask()
        cell.mainImageView.image = nil
        cell.mainImageView.kf.setImage(with: item.product.featuredImage?.url)
        
        cell.titleLabel.text = item.product.title
        cell.priceLabel.text = cell.currencyFormatter.string(for: item.product.price.value)
    }
}
