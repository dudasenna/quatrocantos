//
//  Animation.swift
//  QuatroCantos
//
//  Created by Palloma Ramos on 09/02/21.
//

import SwiftUI
import ConfettiSwiftUI

struct Animation: View {
    @State var counter1:Int = 0
    @State var counter2:Int = 0
    @State var counter3:Int = 0
    @State var counter4:Int = 0
    @State var counter5:Int = 0
    @State var counter6:Int = 0
    
    var body: some View {
        ZStack{
            Text("🎉").font(.system(size: 50)).onTapGesture(){counter1 += 1}
            ConfettiCannon(counter: $counter1,repetitions: 2,repetitionInterval: 0.7)
        }
    }
}

struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        Animation()
    }
}
