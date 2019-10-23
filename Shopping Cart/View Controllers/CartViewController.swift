import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    
    private let cart: Cart = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if cart.items.isEmpty {
            checkoutButton.isHidden = true
            totalLabel.text = "There are no items in your cart."
            totalLabel.textAlignment = .center
        } else {
            totalLabel.text = "Total: $\(cart.totalCost())"
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func checkoutButtonTapped(_ sender: UIButton) {
        cart.items.removeAll()
        dismiss(animated: true, completion: nil)
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") else {
            return UITableViewCell()
        }
        
        let item = cart.items[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.price) Qyt: \(item.quantity)"
        
        return cell
    }
}
