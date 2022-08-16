import SwiftUI

struct CartItemView: View {
    let product: Product

    let onTapIncrease: () -> Void
    let onTapDecrease: () -> Void

    @State var value: Int = 0

    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: product.featuredImage?.url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)

            Spacer()

            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.custom("CormorantGaramond-Regular", size: 20))
                Text(product.price.costLabel)
                    .font(.custom("Raleway-Regular", size: 14))

                Stepper("\(value)", value: $value)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct CartItemView_Previews: PreviewProvider {
    static private let product: Product = Product(
        id: 0,
        title: "Orange Rancher Hat",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        price: Product.Price(value: 45, currency: "USD"),
        inventory: 2,
        images: [Product.Image(type: .defaultRect, src: URL(string: "/assets/orange-rancher-hat/default-rt.jpg")!)]
    )

    static var previews: some View {
        CartItemView(product: product, onTapIncrease: {}, onTapDecrease: {})
    }
}
