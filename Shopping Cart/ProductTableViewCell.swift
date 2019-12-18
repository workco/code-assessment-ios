import UIKit

protocol ProductTableViewCellDelegate: class {
    func didTapAddToCartButton(cell: ProductTableViewCell)
}

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    weak var delegate: ProductTableViewCellDelegate?
    
    private static let quantityFormatter: NumberFormatter = {
        NumberFormatter()
    }()
    
    private static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    func configure(with product: Product, cartItem: CartItem?) {
        productNameLabel.text = "\(product.title)"
        
        var titleComponents: [String] = []
        
        if let formattedCurrency = type(of: self).currencyFormatter.string(from: product.price.value as NSNumber) {
            titleComponents.append(formattedCurrency)
        }
        
        let remainingQuantity = product.inventory - (cartItem?.quantity ?? 0)
        if let formattedQuantity = type(of: self).quantityFormatter.string(from: remainingQuantity as NSNumber) {
            titleComponents.append("x" + formattedQuantity)
        }
        
        productPriceLabel.text = titleComponents.joined(separator: " ")
        
        if remainingQuantity <= 0 {
            addToCartButton.isEnabled = false
            addToCartButton.setTitle("Out of Stock", for: .normal)
        }
    }
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {        
        delegate?.didTapAddToCartButton(cell: self)
    }
}
