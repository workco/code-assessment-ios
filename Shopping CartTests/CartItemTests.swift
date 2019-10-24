import Foundation
import XCTest

@testable import Shopping_Cart

final class CartItemTests : XCTestCase {
    func testSubtotalCalculation() {
        let price = 29.99
        let product = Product(id: 0, name: "Shamwow", price: price, imageURL: nil, stock: 1000)
        for quantity in 0 ... 10 {
            let cartItem = CartItem(product: product, quantity: quantity)
            let doubleQty = Double(quantity)
            XCTAssertEqual(cartItem.subtotal, doubleQty * price)
        }
    }
    
    func testQuantityChanges() {
        let product = Product(id: 0, name: "Shamwow", price: 23.59, imageURL: nil, stock: 1000)
        var item = CartItem(product: product, quantity: 1000)
        for quantity in (0 ... 10).reversed() {
            item = item.withQuantity(quantity)
            XCTAssertEqual(item.quantity, quantity)
        }
    }
}
