import Foundation
import XCTest

@testable import Shopping_Cart

final class ProductTests: XCTestCase {
    var products: [Product] = []

    override func setUp() {
        guard let filePath = Bundle.main.url(forResource: "products", withExtension: "json") else {
            XCTFail("Missing file: products.json")
            return
        }

        do {
            let jsonData = try Data(contentsOf: filePath)
            let decodedProducts = try JSONDecoder().decode([Product].self, from: jsonData)

            products = decodedProducts
        } catch {
            XCTFail("Decoding failed")
        }
    }

    func testFirstProductDecoding() {
        XCTAssertEqual(products[0].id, 1)
        XCTAssertEqual(products[0].title, "Orange Rancher Hat")
        XCTAssertEqual(products[0].price.value, 45)
        XCTAssertEqual(products[0].price.currency, "USD")
        XCTAssertEqual(products[0].inventory, 2)
    }

    func testFirstProductImageDecoding() {
        XCTAssertEqual(products[0].images[0].type, .defaultRect)

        let firstImageURL = try? XCTUnwrap(URL(string: "https://work-co-code-assessment.herokuapp.com/assets/orange-rancher-hat/default-rt.jpg"))
        XCTAssertEqual(products[0].images[0].url, firstImageURL)

        XCTAssertEqual(products[0].images[1].type, .defaultSquare)

        let secondImageURL = try? XCTUnwrap(URL(string: "https://work-co-code-assessment.herokuapp.com/assets/orange-rancher-hat/default-sq.jpg"))
        XCTAssertEqual(products[0].images[1].url, secondImageURL)

        XCTAssertEqual(products[0].images[2].type, .alt1Rect)

        let thirdImageURL = try? XCTUnwrap(URL(string: "https://work-co-code-assessment.herokuapp.com/assets/orange-rancher-hat/alt-1-rt.jpg"))
        XCTAssertEqual(products[0].images[2].url, thirdImageURL)
    }

    func testProductCount() {
        XCTAssertEqual(products.count, 5)
    }

    func testProductImageCount() {
        for product in products {
            XCTAssertEqual(product.images.count, 8)
        }
    }
}
