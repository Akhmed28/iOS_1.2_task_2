import SwiftUI
import Foundation

struct HomeView: View {
    @EnvironmentObject var session: UserSession
    @State private var newTask = ""

    var body: some View {
        VStack {
            HStack {
                TextField("New Task", text: $newTask)
                Button("Add") {
                    if !newTask.isEmpty {
                        session.addTodo(Task(title: newTask))
                        newTask = ""
                    }
                }
            }

            List {
                ForEach(session.currentUser?.todos ?? []) { task in
                    Text(task.title)
                }
            }
        }
        .padding()
    }
}
