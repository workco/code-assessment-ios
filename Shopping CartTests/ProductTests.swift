import Foundation
import XCTest

@testable import Shopping_Cart

final class ProductTests : XCTestCase {
    func testEqualProductEquatable() {
        let matchingID = 1293102312039123
        let product1 = Product(id: matchingID, name: "A", price: 50, imageURL: nil, stock: 1000)
        let product2 = Product(id: matchingID, name: "B", price: 900, imageURL: URL(string: "https://www.google.com"), stock: 500)
        XCTAssertEqual(product1, product2)
    }
    
    func testNonEqualProductEquatable() {
        let product1 = Product(id: 100, name: "B", price: 900, imageURL: URL(string: "https://www.google.com"), stock: 500)
        let product2 = Product(id: 150, name: "B", price: 900, imageURL: URL(string: "https://www.google.com"), stock: 500)
        XCTAssertNotEqual(product1, product2)
    }
}
