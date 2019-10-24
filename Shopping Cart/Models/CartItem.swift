import Foundation

struct CartItem {
    let product: Product
    let quantity: Int
    
    var subtotal: Double {
        product.price * Double(quantity)
    }
    
    func withQuantity(_ newQuantity: Int) -> Self {
        CartItem(product: product, quantity: newQuantity)
    }
}
