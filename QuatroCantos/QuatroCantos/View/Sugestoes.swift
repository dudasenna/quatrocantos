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
        HStack{
            Button(action: {
                viewRouter.currentPage = .page1
            }, label: {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50, alignment: .trailing)
                    .foregroundColor(.white)
                    .shadow(color: Color("cinza_claro"), radius: 2, x: 0, y: 4)
                    //.padding(.trailing, UIScreen.main.bounds.width*0.81)
                    .padding(.top, UIScreen.main.bounds.height*0.1)
                    
            })
        }.background(
            Image("bg_sugestoes")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        
    }
}

struct Sugestoes_Previews: PreviewProvider {
    static var previews: some View {
        Sugestoes(viewRouter: ViewRouter())
    }
}
