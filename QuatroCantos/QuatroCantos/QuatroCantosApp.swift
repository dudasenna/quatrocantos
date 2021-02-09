//
//  QuatroCantosApp.swift
//  QuatroCantos
//
//  Created by Mayara Mendonça de Souza on 04/02/21.
//

import SwiftUI

@main
struct QuatroCantosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView2()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
