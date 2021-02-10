//
//  Motherview.swift
//  QuatroCantos
//
//  Created by Mayara Mendonça de Souza on 09/02/21.
//

import SwiftUI

struct MotherView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
         
        switch viewRouter.currentPage{
        case .page1:
            Launchscreen(viewRouter: viewRouter)
        case .page2:
            Participantes(viewRouter: viewRouter)
        case .page3:
            TimeBar(viewRouter: viewRouter)
        case .page4:
            Resultado(viewRouter: viewRouter)
        case .page5:
            Sugestoes(viewRouter: viewRouter)
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}

// Link do tutorial de navegação: https://blckbirds.com/post/how-to-navigate-between-views-in-swiftui-by-using-an-observableobject/
