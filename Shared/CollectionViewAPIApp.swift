//
//  CollectionViewAPIApp.swift
//  Shared
//
//  Created by Vinay Singh on 19/07/21.
//

import SwiftUI

@main
struct CollectionViewAPIApp: App {
    // persistenceController = PersistenceController.shared

    @StateObject var store = WallpaperStore()
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
