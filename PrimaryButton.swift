struct PrimaryButton: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(Color(red: 0.78, green: 0.0, blue: 0.0))
            .cornerRadius(26)
    }
}
