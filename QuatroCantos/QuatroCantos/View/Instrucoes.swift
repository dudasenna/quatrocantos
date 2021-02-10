//
//  Instrucoes.swift
//  QuatroCantos
//
//  Created by Mayara Mendonça de Souza on 10/02/21.
//

import SwiftUI

struct Instrucoes: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        
        ZStack{
            Color("roxo")
                .ignoresSafeArea(.all)
            
            VStack{
                Text("Conte sua história Conte sua história  Conte sua história Conte sua história Conte sua história  Conte sua história Conte sua história Conte sua história  Conte sua história Conte sua história Conte sua história  Conte sua história")
                    .padding(.all,50)
                    .background(Color.white)
                    //.padding(.all, 50)
                    .cornerRadius(20)
                
                //Spacer(minLength: 0)
                
                Button(action: {
                    viewRouter.currentPage = .page2
                }, label: {
                    Text("Simbora!")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("vermelho"))
                        
                })
            }
        }
        
    }
}

struct Instrucoes_Previews: PreviewProvider {
    static var previews: some View {
        Instrucoes(viewRouter: ViewRouter())
    }
}
