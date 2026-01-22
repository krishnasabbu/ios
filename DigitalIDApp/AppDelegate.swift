import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {

        NotificationCenter.default.post(
            name: .didReceiveVerificationCallback,
            object: url
        )

        return true
    }
}

extension Notification.Name {
    static let didReceiveVerificationCallback = Notification.Name("didReceiveVerificationCallback")
}
