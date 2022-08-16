import SwiftUI

struct ProductItemView: View {
    let product: Product

    let onTapAddToBag: () -> Void

    var body: some View {
        LazyVStack(spacing: 15) {
            AsyncImage(url: product.featuredImage?.url) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure(_):
                    Text("No image available")
                case .empty:
                    ProgressView()
                @unknown default:
                    fatalError()
                }
            }

            HStack {
                VStack(alignment: .leading) {
                    Text(product.title)
                        .font(.custom("CormorantGaramond-Regular", size: 20))
                    Text(product.price.costLabel)
                        .font(.custom("Raleway-Regular", size: 14))
                }

                Spacer()

                Button {
                    onTapAddToBag()
                } label: {
                    Text("Add to Bag")
                        .font(.custom("Raleway-Bold", size: 14))
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .foregroundColor(Color.init("ButtonText"))
                        .background(Color.init("ButtonBackground"))
                        .cornerRadius(20)
                }
            }
        }
        .padding(.horizontal, 30)
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static private let product: Product = Product(
        id: 0,
        title: "Orange Rancher Hat",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        price: Product.Price(value: 45, currency: "USD"),
        inventory: 2,
        images: [Product.Image(type: .defaultRect, src: URL(string: "/assets/orange-rancher-hat/default-rt.jpg")!)]
    )

    static var previews: some View {
        ProductItemView(product: product, onTapAddToBag: {})
    }
}
