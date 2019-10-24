import Foundation
import SwiftCheck

@testable import Shopping_Cart

extension Product : Arbitrary {
    public static var arbitrary: Gen<Self> {
        Gen<Self>.compose { c in
            // we can investigate ways of arbitrarily generating URLs in the future
            Product(id: c.generate(), name: c.generate(), price: c.generate(), imageURL: URL(string: "https://path.com"), stock: c.generate())
        }
    }
}

extension CartItem : Arbitrary {
    public static var arbitrary: Gen<CartItem> {
        Gen<Self>.compose { c in
            CartItem(product: c.generate(), quantity: c.generate())
        }
    }
}
