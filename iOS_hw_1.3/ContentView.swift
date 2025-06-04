//
//  ContentView.swift
//  iOS_hw_1.3
//
//  Created by Akhmed Kudaibergen on 04.06.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var session = UserSession()

    var body: some View {
        Group {
            if session.currentUser != nil {
                TabBarView()
            } else {
                NavigationView {
                    LoginView()
                }
            }
        }
        .environmentObject(session)
    }
}

#Preview {
    ContentView()
}

