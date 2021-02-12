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

import ConfettiSwiftUI

struct ProgressBar: View {
    var value: CGFloat
    
    @State private var isClicked: Bool = false
    
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
    
    func animation(){
        self.isClicked.toggle()
    }

}

struct TimeBar: View {
    
    @State var progressBarValue:CGFloat = 0
    @State private var timeIsUp: Bool = false
    
    @State var counter1 = 1
    @State var counter2 = 1
    @State var counter3 = 1
    @State var counter4 = 1
    @State var counter5 = 1
    
    let bgcolor = Color(red: 68/255, green: 181/255, blue: 163/255, opacity: 1.0)
    
    let perrengues: [String] = ["Já perdi o meu chinelo em Olinda", "Quase morri sufocade com o aperto", "Troquei Olinda pelo Galo da Madrugada", "Já voltei sentado no chão do ônibus"]
    @State var perrengueAleatorio:String = "Já fui no bloco da Lama"
    @State var contadorAuxiliar:Int = 0
    
    let hapitcs = UINotificationFeedbackGenerator()
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            bgcolor
            ProgressBar(value: progressBarValue)
            
            
            Color.white
                .frame(width: 583, height: 245, alignment: .bottom)
                .cornerRadius(12)
                .padding(.top,50)
                .rotation3DEffect( (self.progressBarValue > 1.0  || timeIsUp) ?
                                    .degrees(360) : .degrees(0),
                                   axis: (x: 1.0, y: 0.0, z: 0.0))
                .animation(.spring())
            
            Text(perrengueAleatorio).fontWeight(.semibold).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.black)
            
            Button(action: {
                respondeu()
                
            }, label: {
                Text(sentences[counterAnswers]).fontWeight(.semibold).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.black)
//                 Text("")
//                     .frame(width: 583, height: 245, alignment: .bottom)
            })
            
            ConfettiCannon(counter: $counter5, num: 80, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 300)
            
            VStack{
                HStack{
                    ConfettiCannon(counter: $counter1, num: 20, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
                    Spacer()
                    ConfettiCannon(counter: $counter2, num: 20, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
                }
                Spacer()
                HStack{
                    ConfettiCannon(counter: $counter3, num: 20, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
                    Spacer()
                    ConfettiCannon(counter: $counter4, num: 20, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
                }
                
            }.frame(width: 200, height: 200, alignment: .center)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if(progressBarValue < 1.0){
                    self.progressBarValue += 0.1
                }
                else {
                    timer.invalidate()
                }
                print("oi")
                print(self.progressBarValue)
                
            }
        } .edgesIgnoringSafeArea(.all)
    }
    
    func respondeu(){
        //boolean de botao clicado == true
        self.timeIsUp.toggle()
        
        //mudar o texto, percorrendo o array
        if (contadorAuxiliar < perrengues.count) {
            print("valor do contador é \(contadorAuxiliar)" )
            self.perrengueAleatorio = self.perrengues[contadorAuxiliar]
            print("valor do contador depois de atualizar é \(contadorAuxiliar)" )
        }
        self.contadorAuxiliar += 1
        if (contadorAuxiliar == perrengues.count+1){
            viewRouter.currentPage = .page4
        }
        //zerar o timer
        self.progressBarValue = 0
        counter1 += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            counter4 += 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            counter2 += 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            counter3 += 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            counter5 += 1
        }
        
        //adiciona feedback com haptics
        hapitcs.notificationOccurred(.success)
        
    }
}

struct preview: PreviewProvider {
    static var previews: some View {
        TimeBar(viewRouter: ViewRouter())
    }
}
