import SwiftUI

struct CartSummaryRowView: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .font(.custom("CormorantGaramond-Regular", size: 20))

            Spacer()

            Text(value)
                .font(.custom("Raleway-Regular", size: 14))
        }
        .frame(maxWidth: .infinity)
    }
}

struct CartSummaryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CartSummaryRowView(label: "Shipping", value: "FREE")
    }
}
