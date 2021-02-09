//
//  QuatroCantosApp.swift
//  QuatroCantos
//
//  Created by Mayara Mendonça de Souza on 04/02/21.
//

import SwiftUI

@main
struct QuatroCantosApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
