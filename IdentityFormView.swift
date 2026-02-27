import SwiftUI

struct IdentityFormView: View {

    @State private var firstName = ""
    @State private var middleInitial = ""
    @State private var lastName = ""
    @State private var dob = ""
    @State private var email = ""
    @State private var mobile = ""

    @State private var isAuthorized: Bool = true
    @State private var showMore: Bool = false

    var body: some View {
        BankingTemplateView {

            Spacer().frame(height: 20)

            Text("WELLS FARGO")
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .center)

            Spacer().frame(height: 20)

            Text("Your new account is\nminutes away")
                .font(.system(size: 26, weight: .semibold))

            Spacer().frame(height: 20)

            Text("Your name")
                .font(.system(size: 16, weight: .semibold))

            Group {
                BankingTextField(placeholder: "First name", text: $firstName)
                BankingTextField(placeholder: "Middle initial", text: $middleInitial)
                BankingTextField(placeholder: "Last name", text: $lastName)
            }

            Spacer().frame(height: 20)

            Text("Verify your identity")
                .font(.system(size: 16, weight: .semibold))

            Group {
                BankingTextField(placeholder: "Date of birth", text: $dob)
                BankingTextField(placeholder: "Email", text: $email)
                BankingTextField(placeholder: "Mobile number", text: $mobile)
            }

            Spacer().frame(height: 30)

            // MARK: - Essential Info Section

            Text("Essential info and agreements for you")
                .font(.system(size: 18, weight: .semibold))

            Spacer().frame(height: 14)

            authorizationCard

            Spacer().frame(height: 20)

            agreementsSection

            Spacer().frame(height: 16)

            Text("You won’t be able to return or edit your info after you select Agree and continue.")
                .font(.system(size: 12))
                .foregroundColor(.gray)

            Spacer().frame(height: 30)

            PrimaryButton(title: "Agree and continue")
                .opacity(isAuthorized ? 1 : 0.6)
                .disabled(!isAuthorized)
        }
    }

    // MARK: - Authorization Card

    private var authorizationCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top, spacing: 12) {

                Button {
                    isAuthorized.toggle()
                } label: {
                    Image(systemName: isAuthorized ? "checkmark.square.fill" : "square")
                        .font(.system(size: 20))
                        .foregroundColor(isAuthorized ? .red : .gray)
                        .padding(.top, 2)
                }
                .buttonStyle(.plain)

                VStack(alignment: .leading, spacing: 8) {

                    Text("Authorization for the Social Security Administration to Disclose Your Social Security Number Verification")
                        .font(.system(size: 14, weight: .semibold))
                        .fixedSize(horizontal: false, vertical: true)

                    Text("""
I authorize the Social Security Administration (SSA) to verify and disclose to Wells Fargo Bank, N.A., through Early Warning Services, LLC, their service provider for the purpose of this transaction, whether the name, Social Security Number (SSN) and date of birth I have submitted matches information in SSA records. My consent is for a one-time validation within the next 90 days.
""")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.secondarySystemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color(.separator), lineWidth: 1)
        )
    }

    // MARK: - You Agree Section

    private var agreementsSection: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("You agree:")
                .font(.system(size: 14, weight: .semibold))

            bullet("Wells Fargo must obtain, verify, and record details about anyone opening an account.")

            bullet("Wells Fargo will obtain your consumer report to review your application. This won’t affect your credit score. You confirm your info is true.")

            bullet("Wells Fargo may contact you at any number you provide using automated systems. Message and data rates apply.")

            if showMore {
                bullet("You consent to receive account disclosures electronically where applicable.")

                bullet("Additional product-specific agreements may apply depending on your selected account type.")
            }

            Button(action: {
                withAnimation {
                    showMore.toggle()
                }
            }) {
                HStack(spacing: 6) {
                    Text(showMore ? "Show less" : "Show more")
                        .font(.system(size: 13, weight: .semibold))
                    Image(systemName: showMore ? "chevron.up" : "chevron.down")
                }
                .foregroundColor(.gray)
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.secondarySystemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color(.separator), lineWidth: 1)
        )
    }

    private func bullet(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.gray)
                .padding(.top, 2)

            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
