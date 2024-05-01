//
//  PainTApp.swift
//  PainT
//
//  Created by 최승희 on 4/26/24.
//

import SwiftUI
import SwiftData

@main
struct PainTApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            loginSwiftUIView() // 처음 시작 뷰
        }
        .modelContainer(sharedModelContainer)
    }
}
