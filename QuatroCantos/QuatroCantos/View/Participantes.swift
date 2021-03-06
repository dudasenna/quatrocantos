//
//  Participantes.swift
//  QuatroCantos
//
//  Created by Mayara Mendonça de Souza on 04/02/21.
//

import SwiftUI

struct Box {
    var id: Int
    var imageUrl: String
}

struct Participantes: View {
    
    @StateObject var viewRouter: ViewRouter
    
    let boxes: [Box] = [
        Box(id: 0, imageUrl: "1"),
        Box(id: 1, imageUrl: "2"),
        Box(id: 2, imageUrl: "3")
    ]
    
    var body: some View {
        VStack{
            Text("Quem instiga viver esse Carnaval contigo?")
                .font(.custom("Poppins-Regular", size: 24))
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .padding(.horizontal, 5)
                .background(Color("roxo"))
                //.padding(.top, -20)
            HStack {
                ForEach(boxes, id: \.id) {
                    box in BoxView(box: box).onTapGesture {
                        viewRouter.currentPage = .page3
                        let numeroParticipantes = box.id + 1
                        print("O número de pessoas que vai brincar é \(numeroParticipantes)")
                    }
                }.padding(30)
                .shadow(color: Color("cinza_claro"), radius: 2, x: 0, y: 4)
            }
            .padding()
        }.background(
            Image("bg_participantes")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
}

struct BoxView: View {
    let box: Box
    
    var body: some View {
        Image("\(box.imageUrl)")
            .resizable()
            .cornerRadius(12)
            .frame(width: 171, height: 128)
    }
}

struct Participantes_Previews: PreviewProvider {
    static var previews: some View {
        Participantes(viewRouter: ViewRouter())
        
    }
}
