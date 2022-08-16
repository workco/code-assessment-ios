import Foundation

struct CartItem: Identifiable {
    let product: Product
    let quantity: Int
    
    var subtotal: Double {
        0
    }

    var id: Int { product.id }
    
    func withQuantity(_ newQuantity: Int) -> Self {
        CartItem(product: product, quantity: newQuantity)
    }
}
