import SwiftUI
import Foundation

class UserSession: ObservableObject {
    @Published var users: [User] = []
    @Published var currentUser: User? = nil

    init() {
        loadUsers()
    }

    func register(user: User) -> Bool {
        guard !users.contains(where: { $0.nickname == user.nickname }) else { return false }
        users.append(user)
        saveUsers()
        return true
    }

    func login(nickname: String, password: String) -> Bool {
        if let foundUser = users.first(where: { $0.nickname == nickname && $0.password == password }) {
            currentUser = foundUser
            return true
        }
        return false
    }

    func logout() {
        currentUser = nil
    }

    func addTodo(_ task: Task) {
        guard let index = users.firstIndex(where: { $0.id == currentUser?.id }) else { return }
        users[index].todos.append(task)
        currentUser = users[index]
        saveUsers()
    }

    func saveUsers() {
        if let data = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(data, forKey: "users")
        }
    }

    func loadUsers() {
        if let data = UserDefaults.standard.data(forKey: "users"),
           let decoded = try? JSONDecoder().decode([User].self, from: data) {
            self.users = decoded
        }
    }
}
