import SwiftUI
import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    var firstName: String
    var lastName: String
    var nickname: String
    var password: String
    var todos: [Task] = []
}
