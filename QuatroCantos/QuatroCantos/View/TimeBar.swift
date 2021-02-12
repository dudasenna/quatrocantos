//
//  SwiftUIView.swift
//  QuatroCantos
//
//  Created by Palloma Ramos on 04/02/21.
//

import SwiftUI
import ConfettiSwiftUI

struct ProgressBar: View {
    var value: CGFloat
    
    @State private var isClicked: Bool = false
    
    
    let greenTimer = Color(red: 10/255, green: 160/255, blue: 136/255, opacity: 1.0)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0)
                    .border(Color.white, width: 2)
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(greenTimer)
                    .animation(.default)
                //                Image("confete 1").padding(.leading,380)
            }.cornerRadius(2)
            .padding(.top, -130)
        }.frame(height:9)
        .frame(width:400)
        Spacer()
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
    
    //    let bgcolor = Color(red: 68/255, green: 181/255, blue: 163/255, opacity: 1.0)
    //
    let perrengues: [String] = ["Já perdi o meu chinelo em Olinda", "Quase morri sufocade com o aperto", "Troquei Olinda pelo Galo da Madrugada", "Já voltei sentado no chão do ônibus"]
    @State var perrengueAleatorio:String = "Já fui no bloco da Lama"
    @State var contadorAuxiliar:Int = 0
    
    let bg_timer: [Image] = [Image("bg_timer2"),Image("bg_timer3"),Image("bg_timer4"),Image("bg_timer5"),Image("bg_timer6"),Image("bg_timer7")]
    @State var bgAleatório: Image = Image("bg_timer1")
    @State var bgContador: Int = 0
    
    let hapitcs = UINotificationFeedbackGenerator()
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            bgAleatório
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
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
                Text("")
                    .frame(width: 583, height: 245, alignment: .bottom)
                
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
        } .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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
        if (bgContador < bg_timer.count){
            print("valor do contador é \(bgContador)" )
            self.bgAleatório = self.bg_timer[bgContador]
            print("valor do contador depois de atualizar é \(bgContador)" )
        }
        self.bgContador += 1
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
