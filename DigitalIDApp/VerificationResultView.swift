import SwiftUI

struct VerificationResultView: View {
    let txId: String
    @State private var result: VerificationResult?
    @State private var isLoading = true

    var body: some View {
        VStack(spacing: 20) {

            if isLoading {
                ProgressView("Verifying Document...")
            } else if let result {
                Text("Verification \(result.status)")
                    .font(.title)
                    .bold()
                    .foregroundColor(result.status == "VERIFIED" ? .green : .red)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Name: \(result.fullName)")
                    Text("DOB: \(result.dateOfBirth)")
                    Text("Document: \(result.documentType)")
                }
                .padding()

            } else {
                Text("Verification Failed")
                    .foregroundColor(.red)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Result")
        .onAppear {
            loadResult()
        }
    }

    func loadResult() {
        APIService.shared.fetchVerificationResult(txId: txId) { res in
            DispatchQueue.main.async {
                self.result = res
                self.isLoading = false
            }
        }
    }
}
