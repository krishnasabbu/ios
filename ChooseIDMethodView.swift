struct ChooseIDMethodView: View {
    var body: some View {
        BankingTemplateView {

            Spacer().frame(height: 20)

            Text("WELLS FARGO")
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .center)

            Spacer().frame(height: 20)

            Image("id_hands")
                .resizable()
                .scaledToFit()
                .frame(height: 120)

            Text("Next, let’s confirm\nyour identity")
                .font(.system(size: 24, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.top, 10)

            Spacer().frame(height: 30)

            // Take picture option
            Button(action: {
                // open camera
            }) {
                HStack {
                    Image(systemName: "camera")
                    Text("Take picture of photo ID")
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
            }

            Spacer().frame(height: 20)

            Text("OR")
                .font(.system(size: 14))
                .foregroundColor(.gray)

            Spacer().frame(height: 20)

            // Digital wallet option (dashed border)
            Button(action: {
                // trigger Apple Wallet flow
            }) {
                HStack {
                    Image(systemName: "creditcard")
                    Text("Use digital wallet ID")
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [6]))
                        .foregroundColor(.blue)
                )
            }

            Spacer().frame(height: 20)

            HStack(spacing: 4) {
                Text("Don’t have these IDs?")
                    .foregroundColor(.gray)
                Button("Visit a branch") {
                    // open link
                }
            }
            .font(.system(size: 14))
        }
    }
}
