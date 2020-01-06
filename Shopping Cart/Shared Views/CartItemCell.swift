import Foundation
import UIKit

protocol CartItemCellDelegate: class {
    func didIncrement(cell: CartItemCell)
    func didDecrement(cell: CartItemCell)
}

final class CartItemCell: UITableViewCell, ProductCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    weak var delegate: CartItemCellDelegate?
    
    @IBAction func decrement(sender: UIButton) {
        delegate?.didDecrement(cell: self)
    }
    
    @IBAction func increment(sender: UIButton) {
        delegate?.didIncrement(cell: self)
    }
}
