import UIKit

protocol ProductTableViewCellDelegate: class {
    func didTapAddToCartButton(cell: ProductTableViewCell)
}

final class ProductTableViewCell: UITableViewCell {
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet private weak var addToCartButton: UIButton!
    
    weak var delegate: ProductTableViewCellDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addToCartButton.layer.cornerRadius = addToCartButton.frame.height / 2
        addToCartButton.layer.masksToBounds = true
    }
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {        
        delegate?.didTapAddToCartButton(cell: self)
    }
}
