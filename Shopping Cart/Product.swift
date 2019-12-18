import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Price
    let inventory: Int
    let images: [Image]
    
    struct Image: Codable {
        let type: Type
        let src: URL
    
        enum `Type`: String, Codable {
            case featured, `default`, other
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            type = (try? container.decode(Type.self, forKey: .type)) ?? .other
            src = try container.decode(URL.self, forKey: .src)
        }
    }
    
    struct Price: Codable {
        let value: Double
        let currency: String
    }
}
