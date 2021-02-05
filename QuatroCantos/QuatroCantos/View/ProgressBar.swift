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
                } .cornerRadius(45)
            }.frame(height:15)
        .frame(width:400)
        Spacer()
        }

}
struct ContentView2: View {

    @State var progressBarValue:CGFloat = 1.0

    var body: some View {
        VStack {
            ProgressBar(value: progressBarValue)
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.progressBarValue += -0.1
                }
            }
        }
    }

struct preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView2().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            ContentView2().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            ContentView2().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}

