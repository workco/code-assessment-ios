import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var presentation

    private let cart: Cart = .shared

    var body: some View {
        VStack(spacing: .zero) {
            if cart.items.isEmpty {
                VStack(spacing: 20) {
                    Image("EmptyBag")

                    Text("Your bag is empty")
                        .font(.custom("CormorantGaramond-Regular", size: 30))

                    Text("Please add some products to your bag.")
                        .font(.custom("CormorantGaramond-Regular", size: 20))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                }
            } else {
                VStack(spacing: .zero) {
                    ScrollView(.vertical) {
                        VStack(spacing: 30) {
                            ForEach(cart.items) { cartItem in
                                CartItemView(product: cartItem.product, onTapIncrease: {}, onTapDecrease: {})
                            }
                        }
                        .padding(30)

                        VStack(spacing: 20) {
                            CartSummaryRowView(label: "Subtotal", value: "$248.00")

                            CartSummaryRowView(label: "Taxes", value: "$49.60")

                            CartSummaryRowView(label: "Shipping", value: "FREE")

                            Divider()

                            CartSummaryRowView(label: "Total", value: "$297.60")

                            Button {

                            } label: {
                                Text("Checkout")
                                    .font(.custom("Raleway-Bold", size: 14))
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                    .foregroundColor(Color.init("ButtonText"))
                                    .background(Color.init("ButtonBackground"))
                                    .background(.black)
                                    .cornerRadius(20)
                            }
                        }
                        .padding(30)
                        .background(Color("CartFooterBackground"))
                    }
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
