//
//  SwiftUIView.swift
//  QuatroCantos
//
//  Created by Palloma Ramos on 04/02/21.
//

import SwiftUI
    
struct ProgressBar: View {
    var value: CGFloat
    
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
            .padding(.top, -170)
            }.frame(height:9)
        .frame(width:400)
        Spacer()
        Rectangle()
            .fill(Color.white)
            .frame(width: 583, height: 245, alignment: .bottom)
            .cornerRadius(12)
            .padding(.top,50)
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
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.progressBarValue += 0.1
            }
        } .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    }

struct preview: PreviewProvider {
    static var previews: some View {
        TimeBar(viewRouter: ViewRouter())
    }
}

