import SwiftUI

struct BankingTemplateView<Content: View>: View {

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {

            // Background
            VStack(spacing: 0) {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.90, green: 0.94, blue: 0.97),
                        Color.white
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: UIScreen.main.bounds.height * 0.40)

                Color.white
            }
            .ignoresSafeArea()

            VStack(spacing: 0) {
                content

                Spacer()

                // Bottom yellow line
                Rectangle()
                    .fill(Color(red: 0.98, green: 0.82, blue: 0.20))
                    .frame(height: 3)
                    .ignoresSafeArea(edges: .bottom)
            }
            .padding(.horizontal, 30)
        }
    }
}
