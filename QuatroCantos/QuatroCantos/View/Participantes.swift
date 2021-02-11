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
            Text("Quem instiga pular esse Carnaval contigo?")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack {
                ForEach(boxes, id: \.id) {
                    box in BoxView(box: box).onTapGesture {
//                        mudar page6 para 3 novamente
                        viewRouter.currentPage = .page6
                        let numeroParticipantes = box.id + 1
                        print("O número de pessoas que vai brincar é \(numeroParticipantes)")
                    }
                }.padding(30)
            }
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
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}

struct Participantes_Previews: PreviewProvider {
    static var previews: some View {
        Participantes(viewRouter: ViewRouter())
        
    }
}
