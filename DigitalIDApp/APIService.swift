import Foundation

class APIService {

    static let shared = APIService()

    func createTransaction(completion: @escaping (String?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let mockTxId = UUID().uuidString
            completion(mockTxId)
        }
    }

    func fetchVerificationResult(txId: String, completion: @escaping (VerificationResult?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = VerificationResult(
                status: "VERIFIED",
                fullName: "John Doe",
                dateOfBirth: "1995-01-01",
                documentType: "Driver License"
            )
            completion(result)
        }
    }
}
