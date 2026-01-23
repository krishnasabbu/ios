import SwiftUI

struct OnboardingView: View {
    @State private var isJointAccount: Bool = false

    var body: some View {
        ZStack {
            // MARK: - Background

            VStack(spacing: 0) {
                // Top bluish area
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.90, green: 0.94, blue: 0.97),
                        Color.white
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: UIScreen.main.bounds.height * 0.45)

                // Middle + bottom white area
                Color.white
            }
            .ignoresSafeArea()

            // MARK: - Main Content

            VStack(spacing: 20) {

                Spacer().frame(height: 20)

                // Logo / Title
                Text("WELLS FARGO")
                    .font(.system(size: 20, weight: .semibold))
                    .tracking(1)
                    .foregroundColor(.black)

                // Card Image
                Image("card_image") // <-- Add your card image in Assets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 120)
                    .shadow(radius: 5)

                // Headline
                Text("Fast. Simple. Effortless.")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.top, 10)

                // Subsection title
                Text("Everyday Checking")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(.top, 8)

                // Bullet points
                VStack(alignment: .leading, spacing: 8) {
                    Text("• Existing customers sign on faster")
                    Text("• Have your SSN or ITIN and ID card handy")
                }
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.top, 5)

                // Toggle row
                HStack {
                    Toggle(isOn: $isJointAccount) {
                        Text("I’m applying for a joint account")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .gray))
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)

                // Primary Button
                Button(action: {
                    // Handle Let's go
                }) {
                    Text("Let’s go")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color(red: 0.78, green: 0.0, blue: 0.0))
                        .cornerRadius(26)
                }
                .padding(.horizontal, 30)
                .padding(.top, 20)

                // Secondary Button
                Button(action: {
                    // Handle Sign on
                }) {
                    Text("Sign on")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .overlay(
                            RoundedRectangle(cornerRadius: 26)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }
                .padding(.horizontal, 30)
                .padding(.top, 5)

                // Footer text
                Text("By continuing, you agree you are authorized to share details about your account and device.")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.top, 15)

                Spacer()

                // Bottom yellow line
                Rectangle()
                    .fill(Color(red: 0.98, green: 0.82, blue: 0.20))
                    .frame(height: 3)
            }
        }
    }
}
