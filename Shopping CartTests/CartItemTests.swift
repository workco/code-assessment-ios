import Foundation
import XCTest
import SwiftCheck

@testable import Shopping_Cart

final class CartItemTests : XCTestCase {
    func testSubtotalCalculation() {
        property("Product subtotal calculation is correct") <- forAll { (item: CartItem) in
            let expected = Double(item.quantity) * item.product.price
            return item.subtotal == expected
        }
    }
    
    func testQuantityChanges() {
        property("Products can be duplicated with new quantities") <- forAll { (item: CartItem) in
            let newQuantityGen = Int.arbitrary.suchThat { $0 != item.quantity }
            return forAll(newQuantityGen) { newQuantity in
                item.withQuantity(newQuantity).quantity == newQuantity
            }
        }
    }
}
