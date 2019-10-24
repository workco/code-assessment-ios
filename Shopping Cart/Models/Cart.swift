import Foundation

final class Cart {
    static let shared = Cart()
    
    private(set) var items: [CartItem] = []
    
    var totalCost: Double {
        items.reduce(0, { $0 + $1.subtotal })
    }
    
    func item(for product: Product) -> CartItem? {
        items.first(where: { $0.product == product })
    }
    
    func contains(product: Product) -> Bool {
        items.contains(where: { $0.product == product })
    }
    
    func add(_ product: Product) {
        if let i = items.firstIndex(where: { $0.product == product }) {
            let item = items[i]
            items[i] = item.withQuantity(item.quantity + 1)
        }
        else {
            items.append(CartItem(product: product, quantity: 1))
        }
    }
    
    func update(product: Product, withQuantity quantity: Int) {
        // To be implemented
    }
    
    func remove(_ product: Product) {
        // To be implemented
    }
    
    func empty() {
        items.removeAll()
    }
}
