struct ConfirmIdentityView: View {
    var body: some View {
        BankingTemplateView {

            Spacer().frame(height: 20)

            Text("WELLS FARGO")
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .center)

            Spacer().frame(height: 40)

            Image("id_hands") // add your illustration here
                .resizable()
                .scaledToFit()
                .frame(height: 140)

            Spacer().frame(height: 20)

            Text("Next, let’s confirm\nyour identity")
                .font(.system(size: 26, weight: .semibold))
                .multilineTextAlignment(.center)

            Spacer().frame(height: 30)

            NavigationLink(destination: ChooseIDMethodView()) {
                PrimaryButton(title: "Continue")
            }
        }
    }
}
