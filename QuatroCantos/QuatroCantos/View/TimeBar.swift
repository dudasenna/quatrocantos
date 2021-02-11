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
    
    let bgcolor = Color(red: 68/255, green: 181/255, blue: 163/255, opacity: 1.0)
    
    @StateObject var viewRouter: ViewRouter

    var body: some View {
        ZStack {
            bgcolor
            ProgressBar(value: progressBarValue)
            Button(action: {
                viewRouter.currentPage = .page4
            }, label: {
                Text("Já perdi meu chinelo em Olinda").fontWeight(.semibold).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.black)
            })
            
                Color.white
                .frame(width: 583, height: 245, alignment: .bottom)
                .cornerRadius(12)
                .padding(.top,50)
                    .rotation3DEffect( self.progressBarValue==1.0 ?
                                    .degrees(360) : .degrees(0),
                    axis: (x: 1.0, y: 0.0, z: 0.0))
                    .animation(.spring())
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: self.progressBarValue<1.0 ? true : false) { timer in
//                self.progressBarValue<=1.0
//                    ?
                    self.progressBarValue += 0.1
//                : self.progressBarValue=0
                
                
                print("oi")
                print(self.progressBarValue)
            }
        } .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    }

struct preview: PreviewProvider {
    static var previews: some View {
        TimeBar(viewRouter: ViewRouter())
    }
}

