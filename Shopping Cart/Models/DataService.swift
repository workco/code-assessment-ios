import Foundation

final class DataService {
    static let shared = DataService()
    
    func fetchDailyDeals() -> [Product] {
        guard let fileURL = Bundle(for: DataService.self).url(forResource: "products", withExtension: "json") else {
            return []
        }
        
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let decodedProducts = try decoder.decode([Product].self, from: jsonData)
            return decodedProducts
        }
        catch {
            return []
        }
    }
}
