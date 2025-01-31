//
//  CarouselApp.swift
//  Carousel
//
//  Created by Macbook Pro  M'ed on 30/01/25.
//

import SwiftUI

@main
struct CarouselApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
