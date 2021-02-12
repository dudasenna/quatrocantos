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
            Spacer()
            Color("roxo")
                .ignoresSafeArea(.all)
            
            RoundedRectangle(cornerRadius:20)
                .foregroundColor(.white)
                .padding(.horizontal, 150)
                .padding(.vertical, 50)
                .shadow(color: Color("cinza_claro"), radius: 2, x: 0, y: 4)
           
            VStack{
                
                Text("Instruções")
                    .font(.custom("Poppins-Regular", size: 19))
                    .fontWeight(.semibold)
                
                Text("Mande sua história Mande sua história Mande sua história Mande sua história Mande sua história Mande sua história Mande sua história Mande sua história Mande sua história")
                    .font(.custom("Poppins-Regular", size: 16))
                    .padding(.horizontal, 80)
                    .padding(.vertical, 20)

                Button(action: {
                    viewRouter.currentPage = .page2
                }, label: {
                    Text("Simbora!")
                        .font(.custom("Poppins-Regular", size: 18))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("vermelho")
                                        .cornerRadius(5)
                                        .shadow(color: Color("cinza_claro"), radius: 2, x: 0, y: 4))
                })
            }
            .padding(.horizontal, 100)
            .padding(.vertical, 50)
        }
        
    }
}

struct Instrucoes_Previews: PreviewProvider {
    static var previews: some View {
        Instrucoes(viewRouter: ViewRouter())
    }
}
