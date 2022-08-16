import Foundation

struct Product: Codable, Equatable {
    let id: Int
    let title: String
    let description: String
    let price: Price
    let inventory: Int
    let images: [Image]
    
    var featuredImage: Image? {
        images.first(where: { $0.type == .defaultRect })
    }

    static func ==(lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
}

extension Product {
    struct Image: Codable {
        private static let baseURL = URL(string: "https://work-co-code-assessment.herokuapp.com")!

        let type: Type
        private let src: URL

        var url: URL {
            guard src.host == nil else { return src }
            let output = Image.baseURL.appendingPathComponent(src.relativePath)
            return output
        }

        enum `Type`: String, Codable {
            case defaultRect
            case defaultSquare
            case alt1Rect
            case alt1Square
            case alt2Rect
            case alt2Square
            case alt3Rect
            case alt3Square
            case other
        }

        init(type: Type, src: URL) {
            self.type = type
            self.src = src
        }
    }
}

extension Product {
    struct Price: Codable {
        let value: Double
        let currency: String

        var costLabel: String {
            [String(value), currency].joined(separator: " ")
        }

        init(value: Double, currency: String) {
            self.value = value
            self.currency = currency
        }
    }
}
