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
    let boxes: [Box] = [
        Box(id: 0, imageUrl: "1"),
        Box(id: 1, imageUrl: "2"),
        Box(id: 2, imageUrl: "3"),
        Box(id: 3, imageUrl: "4"),
        Box(id: 4, imageUrl: "5"),
        Box(id: 5, imageUrl: "6")
    ]
    
    var body: some View {
        Text("Quantas pessoas vão brincar?")
            .font(.title2)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        ScrollView(.horizontal) {
            HStack {
                ForEach(boxes, id: \.id) {
                    box in BoxView(box: box).onTapGesture {
                        let numeroParticipantes = box.id + 1
                        print("O número de pessoas que vai brincar é \(numeroParticipantes)")
                    }
                }.padding(30)
            }
        }
        Text("Próximo")
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
        //Modificar o preview para o modo Landscape
        Participantes().previewLayout(.fixed(width: 896, height: 414))
        
    }
}
