//
//  SwiftUIView.swift
//  QuatroCantos
//
//  Created by Palloma Ramos on 04/02/21.
//

import SwiftUI
import SpriteKit
import GameKit

var sentences = ["Já perdeu um chinelo em Olinda?", "Já foi levado por um bloco?", "Já disse a um amigo 'a gente se encontra lá' e nunca se acharam?", "Opção 4", "Opção 5"]
var suggestions = ["Rolê sugerido 1", "Rolê sugerido 2", "Rolê sugerido 3"]
    
struct ProgressBar: View {
    var value: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                        .opacity(0.1)
                    Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color(UIColor.white))
                        .animation(.default)
                Image("confete 1").padding(.leading,380)
                }.cornerRadius(60)
            .padding(.top, -170)
            }.frame(height:9)
        .frame(width:400)
        Spacer()
        Rectangle()
            .fill(Color.white)
            .frame(width: 583, height: 245, alignment: .bottom)
            .cornerRadius(12)
            .padding(.top,50)
        
        SpriteView(scene: GameScene(size: CGSize(width: 300, height: 400)))
                    .frame(width: 1, height: 1)
    }

}
struct TimeBar: View {

    @State var progressBarValue:CGFloat = 0
    
    let bgcolor = Color(red: 68/255, green: 181/255, blue: 163/255, opacity: 1.0)
    
    @StateObject var viewRouter: ViewRouter

    var body: some View {
        ZStack {
            bgcolor
            ProgressBar(value: progressBarValue)
            Button(action: {
                viewRouter.currentPage = .page4
            }, label: {
                Text(sentences[counterAnswers]).fontWeight(.semibold).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.black)
            })
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.progressBarValue += 0.1
            }
        } .edgesIgnoringSafeArea(.all)
    }
    }

struct preview: PreviewProvider {
    static var previews: some View {
        TimeBar(viewRouter: ViewRouter())
    }
}

