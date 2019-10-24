import Foundation

struct CartItem {
    let product: Product
    let quantity: Int
    
    var subtotal: Double {
        return product.price * Double(quantity)
    }
    
    func withQuantity(_ newQuantity: Int) -> Self {
        return CartItem(product: product, quantity: newQuantity)
    }
}
