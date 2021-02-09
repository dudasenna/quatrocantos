//
//  Sugestoes.swift
//  QuatroCantos
//
//  Created by Mayara Mendonça de Souza on 09/02/21.
//

import SwiftUI

struct Sugestoes: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        Text("Sugestão de rolês")
        Button(action: {
            viewRouter.currentPage = .page1
        }, label: {
            Text("Voltar ao início")
        })
    }
}

struct Sugestoes_Previews: PreviewProvider {
    static var previews: some View {
        Sugestoes(viewRouter: ViewRouter())
    }
}
