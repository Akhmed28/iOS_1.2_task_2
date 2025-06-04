import SwiftUI
import Foundation

struct Task: Codable, Identifiable {
    var id = UUID()
    var title: String
    var isDone: Bool = false
}
