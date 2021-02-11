//
//  SwiftUIView.swift
//  QuatroCantos
//
//  Created by Palloma Ramos on 04/02/21.
//

import SwiftUI

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
        //        Button(action: self.animation, label: {
        //            Color.white
        //            .frame(width: 583, height: 245, alignment: .bottom)
        //            .cornerRadius(12)
        //            .padding(.top,50)
        //            .rotation3DEffect( isClicked ?
        //                                .degrees(360) : .degrees(0),
        //                axis: (x: 1.0, y: 0.0, z: 0.0))
        //                .animation(.spring())
        //        })
    }
    
    func animation(){
        self.isClicked.toggle()
    }
    
}
struct TimeBar: View {
    
    @State var progressBarValue:CGFloat = 0
    @State private var timeIsUp: Bool = false
    
    let bgcolor = Color(red: 68/255, green: 181/255, blue: 163/255, opacity: 1.0)
    
    let perrengues: [String] = ["Já perdi o meu chinelo em Olinda", "Quase morri sufocade com o aperto", "Troquei Olinda pelo Galo da Madrugada", "sadsdga"]
    @State var perrengueAleatorio:String = "Já fui no bloco da Lama"
    @State var contadorAuxiliar:Int = 0
    
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
                Text("Responder")
                
            })
                
            Button(action: {
                viewRouter.currentPage = .page4
            }, label: {
                Text("Próximo")
            })
            .padding(.top, 50)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                //                self.progressBarValue<=1.0
                //                    ?
                
                
                
                if(progressBarValue < 1.0){
                    self.progressBarValue += 0.1
                }
                else {
                    timer.invalidate()
                }
                
                
                //                : self.progressBarValue=0
                
                
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
        self.contadorAuxiliar += 1
        if (contadorAuxiliar == perrengues.count+1){
            viewRouter.currentPage = .page4
        }
        //zerar o timer
        self.progressBarValue = 0
        
        
    }
}

struct preview: PreviewProvider {
    static var previews: some View {
        TimeBar(viewRouter: ViewRouter())
    }
}
