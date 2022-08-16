import SwiftUI

struct ProductsView: View {
    @State var products: [Product]?

    private let dataService: DataService = .shared
    private let cart: Cart = .shared

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 42) {
                ForEach(products ?? [], id: \.id) { product in
                    ProductItemView(product: product) {
                        cart.add(product)
                    }
                }
            }
        }
        .onAppear {
            products = dataService.fetchDailyDeals()
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
