//
//  Resultado.swift
//  QuatroCantos
//
//  Created by Mayara Mendonça de Souza on 09/02/21.
//

import SwiftUI

struct Resultado: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        Text("Resultado")
        Button(action: {
            viewRouter.currentPage = .page5
        }, label: {
            Text("Próximo")
        })
    }
}

struct Resultado_Previews: PreviewProvider {
    static var previews: some View {
        Resultado(viewRouter: ViewRouter())
    }
}
