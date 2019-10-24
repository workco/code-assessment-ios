import UIKit

protocol ProductTableViewCellDelegate: class {
    func didTapAddToCartButton(cell: ProductTableViewCell)
}

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    weak var delegate: ProductTableViewCellDelegate?
    
    func configure(withProduct product: Product, cartItem: CartItem?) {
        productNameLabel.text = "\(product.name)"
        
        let remainingQuantity = product.stock - (cartItem?.quantity ?? 0)
        productPriceLabel.text = "$ \(product.price) x\(remainingQuantity)"
        
        if remainingQuantity <= 0 {
            addToCartButton.isEnabled = false
            addToCartButton.setTitle("Out of Stock", for: .normal)
        }
    }
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {        
        delegate?.didTapAddToCartButton(cell: self)
    }
}
