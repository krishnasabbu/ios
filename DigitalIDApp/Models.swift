import Foundation

struct VerificationResult: Codable {
    let status: String
    let fullName: String
    let dateOfBirth: String
    let documentType: String
}
