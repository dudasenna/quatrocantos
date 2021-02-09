//
//  Lauchscreen.swift
//  QuatroCantos
//
//  Created by Mayara Mendonça de Souza on 09/02/21.
//

import SwiftUI

struct Launchscreen: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack{
            Text("Launchscreen")
            Button(action: {
                viewRouter.currentPage = .page2
            }, label: {
                Text("Começar")
            })
        }
        
    }
}

struct Launchscreen_Previews: PreviewProvider {
    static var previews: some View {
        Launchscreen(viewRouter: ViewRouter())
    }
}
