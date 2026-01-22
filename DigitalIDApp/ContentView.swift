import SwiftUI

struct ContentView: View {
    @State private var showVerification = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {

                Text("Digital ID Verification")
                    .font(.largeTitle)
                    .bold()

                Button(action: {
                    showVerification = true
                }) {
                    Text("Use Digital Wallet ID")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("Welcome")
            .navigationDestination(isPresented: $showVerification) {
                WalletVerificationView()
            }
        }
    }
}
