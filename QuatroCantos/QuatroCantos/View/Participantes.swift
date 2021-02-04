//
//  Participantes.swift
//  QuatroCantos
//
//  Created by Mayara Mendonça de Souza on 04/02/21.
//

import SwiftUI

struct Participantes: View {
    var body: some View {
        Text("Selecione a quantidade de pessoas")
            .padding()
    }
}

struct Participantes_Previews: PreviewProvider {
    static var previews: some View {
        //Modificar o preview para o modo Landscape
        Participantes().previewLayout(.fixed(width: 896, height: 414))
        
    }
}
