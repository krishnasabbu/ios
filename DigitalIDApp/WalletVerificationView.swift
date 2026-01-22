import SwiftUI

struct WalletVerificationView: View {
    @State private var isVerifying = false
    @State private var navigateToResult = false
    @State private var txId: String?

    var body: some View {
        VStack(spacing: 30) {

            Text("Verify with Apple Wallet")
                .font(.title2)
                .bold()

            if isVerifying {
                ProgressView("Waiting for Wallet Verification...")
            }

            Button("Start Verification") {
                startVerificationFlow()
            }
            .disabled(isVerifying)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            NavigationLink(
                destination: VerificationResultView(txId: txId ?? ""),
                isActive: $navigateToResult
            ) {
                EmptyView()
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Wallet Verification")
    }

    func startVerificationFlow() {
        isVerifying = true

        APIService.shared.createTransaction { createdTxId in
            guard let createdTxId else {
                isVerifying = false
                return
            }

            SafariAuthManager.shared.startVerification(txId: createdTxId) { returnedTxId in
                DispatchQueue.main.async {
                    self.txId = returnedTxId
                    self.isVerifying = false
                    self.navigateToResult = true
                }
            }
        }
    }
}
