import SwiftUI
import Foundation

struct LoginView: View {
    @EnvironmentObject var session: UserSession
    @State private var nickname = ""
    @State private var password = ""
    @State private var isLoggedIn = false

    var body: some View {
        VStack {
            TextField("Nickname", text: $nickname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Login") {
                if session.login(nickname: nickname, password: password) {
                    isLoggedIn = true
                }
            }
            NavigationLink("Register", destination: RegisterView())
        }
        .fullScreenCover(isPresented: $isLoggedIn) {
            TabBarView().environmentObject(session)
        }
        .padding()
    }
}
