import UIKit

protocol AddToCartButtonDelegate: class {
    func didTapAddToCartButton(_ tag: Int)
}

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    weak var delegate: AddToCartButtonDelegate?
    
    func configure(with product: Product) {
        productNameLabel.text = "\(product.name)"
        productPriceLabel.text = "$ \(product.price) x\(product.stock)"
        
        if product.stock == 0 {
            addToCartButton.isEnabled = false
            addToCartButton.setTitle("Out of Stock", for: .normal)
        }
    }
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {        
        delegate?.didTapAddToCartButton(sender.tag)
    }
}
