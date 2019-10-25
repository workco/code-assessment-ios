import Foundation
import XCTest
import SwiftCheck

@testable import Shopping_Cart

final class CartTests: XCTestCase {
    func testTotalCostCalculation() {
        property("Cart calculates total cost of its items") <- forAll { (products: Array<Product>) in
            let cart = Cart()
            products.forEach(cart.add)
            let expectedSum = products.reduce(0, { $0 + $1.price })
            return cart.totalCost == expectedSum
        }
    }
    
    func testCartAdd() {
        let cart = Cart()
        property("Items can be added to the cart") <- forAll { (product: Product) in
            cart.add(product)
            let itWorked = cart.items.contains(where: { $0.product == product })
            return itWorked
        }
    }
    
    func testCartAddSameItem() {
        property("Cart updates quantity when the same item is added multiple times") <- forAll { (product: Product, n: UInt) in
            let cart = Cart()
            for _ in 0 ..< n {
                cart.add(product)
            }
            if let item = cart.item(for: product) {
                return item.quantity == n
            }
            else {
                return n == 0
            }
        }
    }
    
    func testCartEntryLookup() {
        property("Cart returns items which have been added") <- forAll { (products: Array<Product>) in
            let cart = Cart()
            products.forEach(cart.add)
            for product in products {
                if let item = cart.item(for: product) {
                    if item.product != product {
                        return false
                    }
                }
                else {
                    return false
                }
            }
            return true
        }
    }
    
    func testCartInclusionTest() {
        property("Cart returns whether or not it contains an item") <- forAll { (products: Array<Product>) in
            let cart = Cart()
            products.forEach(cart.add)
            for product in products {
                if !cart.contains(product: product) {
                    return false
                }
            }
            return true
        }
    }
    
    func testCartEmpty() {
        property("Cart can be emptied") <- forAll {  (products: Array<Product>) in
            let cart = Cart()
            products.forEach(cart.add)
            cart.empty()
            return cart.items.isEmpty
        }
    }
}
