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
        ZStack{
            RoundedRectangle(cornerRadius:20)
                .foregroundColor(.white)
                .padding(.horizontal, 120)
                .padding(.vertical, 50)
                .shadow(color: Color("cinza_claro"), radius: 2, x: 0, y: 4)
            
            VStack{
                VStack{
                    Image("ei_folioes")
                        .renderingMode(.original)
                        .scaleEffect(1.2)
                        .padding(.top, -50)
                    Group {
                        
                        Text("\n Tem coisa melhor que descer as ladeiras nessa festa? \n \n Vem descobrir qual o ")
                            .font(.custom("Poppins-Regular", size: 16))
                        +
                        Text("próximo rolê")
                            .font(.custom("Poppins-Regular", size: 16))
                            .bold()
                        +
                        Text(" de vocês pra \n não deixar essa alegria passar!")
                            .font(.custom("Poppins-Regular", size: 16))
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 80)
                    .padding(.bottom, 20)
                }
                
                
                Button(action: {
                    viewRouter.currentPage = .page5
                }, label: {
                    Text("Simbora!")
                        .font(.custom("Poppins-Regular", size: 18))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("verde")
                                        .cornerRadius(5)
                                        .shadow(color: Color("cinza_claro"), radius: 2, x: 0, y: 4))
                })
            }
        }
        .background(
            Image("bg_resultado")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        
    }
}

struct Resultado_Previews: PreviewProvider {
    static var previews: some View {
        Resultado(viewRouter: ViewRouter())
    }
}
