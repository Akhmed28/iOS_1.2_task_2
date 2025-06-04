import SwiftUI
import Foundation

struct RegisterView: View {
    @EnvironmentObject var session: UserSession
    @Environment(\.dismiss) var dismiss

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var nickname = ""
    @State private var password = ""

    var body: some View {
        VStack {
            TextField("First Name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Last Name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Nickname", text: $nickname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Register") {
                let newUser = User(id: UUID(), firstName: firstName, lastName: lastName, nickname: nickname, password: password)
                if session.register(user: newUser) {
                    dismiss()
                }
            }
        }
        .padding()
    }
}
