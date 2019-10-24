import Foundation

struct Product: Equatable {
    let id: Int
    let name: String
    let price: Double
    let imageURL: URL?
    let stock: Int
    
    static func ==(lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name && lhs.price == rhs.price && lhs.imageURL == rhs.imageURL && lhs.stock == rhs.stock
    }
}
