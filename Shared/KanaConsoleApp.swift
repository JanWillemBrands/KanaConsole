//
//  KanaConsoleApp.swift
//  Shared
//
//  Created by Johannes Brands on 04/05/2022.
//

import os.log
import SwiftUI

let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "\(#function)")

@main
struct KanaConsoleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
