//
//  Lauchscreen.swift
//  QuatroCantos
//
//  Created by Mayara Mendonça de Souza on 09/02/21.
//

import SwiftUI

struct Launchscreen: View {
    
    @StateObject var viewRouter: ViewRouter
    
    // Inicializa o audio player como um Observable Object
    @ObservedObject var audioPlayer = AudioPlayer()
    
    var body: some View {
        ZStack{
            Color("amarelo")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
                    Button(action: {
                        print("apertou botão de instruções")
                        viewRouter.currentPage = .page6
                    }, label: {
                        Text("Instruções")
                            .foregroundColor(Color("roxo"))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .underline()
                            .padding(.trailing, UIScreen.main.bounds.width*0.75)
                    })
                    
                    // Chama a função starPlayback do audioPlayer
                    Button(action: {
                        print("apertou botão de som")
                        self.audioPlayer.startPlayBack(fileName: "vassourinhas", fileExtension: "mp3")
                    }, label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32, alignment: .trailing)
                            .foregroundColor(Color("roxo"))
                        
                    })
                    
                }
                
                
                Image("ladeirada")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.6)
                
                Button(action: {
                    print("apertou botão de play")
                    viewRouter.currentPage = .page2
                }) {
                    Image("play_button")
                        .renderingMode(.original)
                }
            }
        }
//        .background(
//                    Image("bg_launchscreen")
//                        .resizable()
//                        .edgesIgnoringSafeArea(.all)
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                )
        
    }
}

struct Launchscreen_Previews: PreviewProvider {
    static var previews: some View {
        Launchscreen(viewRouter: ViewRouter())
    }
}
