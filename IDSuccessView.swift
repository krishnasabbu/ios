struct IDSuccessView: View {
    var body: some View {
        BankingTemplateView {

            Spacer().frame(height: 20)

            Text("WELLS FARGO")
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .center)

            Spacer().frame(height: 40)

            // Green check
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)

            Spacer().frame(height: 20)

            Text("Success!")
                .font(.system(size: 28, weight: .semibold))

            Text("Your ID was verified")
                .font(.system(size: 18))
                .foregroundColor(.gray)

            Spacer().frame(height: 30)

            NavigationLink(destination: ConfirmIdentityView()) {
                PrimaryButton(title: "Continue")
            }

            Spacer().frame(height: 40)

            Text("Deposit products offered by Wells Fargo Bank, N.A. Member FDIC.")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
}
