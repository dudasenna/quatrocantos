//
//  SwiftUIView.swift
//  QuatroCantos
//
//  Created by Palloma Ramos on 04/02/21.
//

import SwiftUI

//PRIMEIRA TENTATIVA

//struct ProgressBar: View {
//    @Binding var value: Float
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .leading){
//                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
//                    .opacity(0.3)
//                    .foregroundColor(Color(UIColor.systemOrange))
//                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
//                    .foregroundColor(Color(UIColor.systemOrange)).animation(.linear)
//            }.cornerRadius(45.0)
//        }
//    }
//}
//
//struct ContentView2: View {
//    @State var progressValue: Float = 1.0
//
//    var body: some View {
//            VStack {
//                ProgressBar(value: $progressValue).frame(height: 20)
//
//                Button(action: {
//                    self.startProgressBar()
//                }) {
//                    Text("Start Progress")
//                }.padding()
//
//                Button(action: {
//                    self.resetProgressBar()
//                }) {
//                    Text("Reset")
//                }
//
//                Spacer()
//            }.padding()
//    }
//
//        func startProgressBar() {
//            for _ in 0...80 {
//                self.progressValue += -0.015
//            }
//        }
//
//        func resetProgressBar() {
//            self.progressValue = 1.0
//        }
//    }
//
//struct preview: PreviewProvider {
//    static var previews: some View {
//        ContentView2().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}


//SEGUNDA TENTATIVA

struct ProgressBar: View {
    var value:CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .trailing) {
//                Text("Progress: \(self.getPercentage(self.value))")
//                    .padding()
                ZStack(alignment: .leading) {
                    Rectangle()
                        .opacity(0.1)
                    Rectangle()
                        .frame(minWidth: 0, idealWidth:self.getProgressBarWidth(geometry: geometry),
                               maxWidth: self.getProgressBarWidth(geometry: geometry))
//                        .opacity(1)
//                        .background(Color.orange)
                        .foregroundColor(Color(UIColor.systemOrange))
                        .animation(.default)
                } .cornerRadius(45)
                .frame(height:20)
            }.frame(height:20)
        }
    }
    
    func getProgressBarWidth(geometry:GeometryProxy) -> CGFloat {
        let frame = geometry.frame(in: .global)
        return frame.size.width * value
    }
    
//    func getPercentage(_ value:CGFloat) -> String {
//        let intValue = Int(ceil(value * 100))
//        return "\(intValue) %"
//    }
}
struct ContentView2: View {

    @State var progressBarValue:CGFloat = 1.0

    var body: some View {
        VStack {
            ProgressBar(value: progressBarValue)
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.progressBarValue += -0.1
//                if (self.progressBarValue >= -0.9) {
//                    timer.invalidate()
                }
            }
        }
    }
//}

struct preview: PreviewProvider {
    static var previews: some View {
        ContentView2().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

