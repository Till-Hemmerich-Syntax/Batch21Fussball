//
//  Batch21FussballApp.swift
//  Batch21Fussball
//
//  Created by Till Hemmerich on 08.11.24.
//

import SwiftUI
import SwiftData
@main
struct Batch21FussballApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for:[Spieler.self,Manschaft.self])
        }
    }
}
