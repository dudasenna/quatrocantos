//
//  SwiftUIView.swift
//  QuatroCantos
//
//  Created by Palloma Ramos on 04/02/21.
//

import SwiftUI
    
struct ProgressBar: View {
    var value: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                        .opacity(0.1)
                    Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color(UIColor.systemOrange))
                        .animation(.default)
                Image("confete 1").padding(.leading,380)
                }.cornerRadius(60)
            .padding(.top, -170)
            }.frame(height:15)
        .frame(width:400)
        Spacer()
        }

}
struct TimeBar: View {
    @State var progressBarValue:CGFloat = 0
    
    let bgcolor = Color(red: 68/255, green: 181/255, blue: 163/255, opacity: 1.0)

    var body: some View {
        ZStack {
            bgcolor
            ProgressBar(value: progressBarValue)
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.progressBarValue += 0.1
            }
        } .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    }

struct preview: PreviewProvider {
    static var previews: some View {
        TimeBar()
    }
}

