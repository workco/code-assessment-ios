import Foundation
import XCTest
import SwiftCheck

@testable import Shopping_Cart

final class ProductTests : XCTestCase {
    func testProductEquality() {
        property("Products with the same values are treated as equal") <- forAll { (p: Product) in
            p == p
        }
    }
    
    func testProductInequality() {
        property("Product with different IDs but the same attributes fail the equality test") <- forAll { (p1: Product) in
            let productGen = Product.arbitrary.suchThat {
                [$0.id != p1.id, $0.name != p1.name, $0.price != p1.price, $0.imageURL != p1.imageURL, $0.stock != p1.stock].shuffled().reduce(false, { $0 || $1 })
            }
            return forAll(productGen) { p2 in
                p1 != p2
            }
        }
    }
}
