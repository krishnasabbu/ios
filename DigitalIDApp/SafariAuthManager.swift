import Foundation
import AuthenticationServices

class SafariAuthManager: NSObject, ASWebAuthenticationPresentationContextProviding {

    static let shared = SafariAuthManager()
    private var session: ASWebAuthenticationSession?

    func startVerification(txId: String, completion: @escaping (String?) -> Void) {

        let urlString = "https://your-rp.com/startVerification?txId=\(txId)"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        session = ASWebAuthenticationSession(
            url: url,
            callbackURLScheme: "digitalidapp"
        ) { callbackURL, error in

            guard
                let callbackURL = callbackURL,
                let components = URLComponents(url: callbackURL, resolvingAgainstBaseURL: false),
                let txId = components.queryItems?
                    .first(where: { $0.name == "txId" })?.value
            else {
                completion(nil)
                return
            }

            completion(txId)
        }

        session?.presentationContextProvider = self
        session?.prefersEphemeralWebBrowserSession = true
        session?.start()
    }

    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows.first { $0.isKeyWindow } ?? ASPresentationAnchor()
    }
}
