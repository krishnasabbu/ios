struct IdentityFormView: View {

    @State private var firstName = ""
    @State private var middleInitial = ""
    @State private var lastName = ""
    @State private var dob = ""
    @State private var email = ""
    @State private var mobile = ""

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

            PrimaryButton(title: "Continue")
        }
    }
}
