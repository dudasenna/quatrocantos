//
//  Lauchscreen.swift
//  QuatroCantos
//
//  Created by Mayara Mendonça de Souza on 09/02/21.
//

import SwiftUI
import AVFoundation

struct Launchscreen: View {
    
    @StateObject var viewRouter: ViewRouter
    
    // Variaveis para controlar a música
    @State var isPlaying: Bool = true
    @State var buttonImageName: String = "speaker.wave.2.fill"
    
    var body: some View {
        ZStack{
            //Color("amarelo")
                //.edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
//                    Button(action: {
//                        print("apertou botão de instruções")
//                        viewRouter.currentPage = .page6
//                    }, label: {
//                        Text("Instruções")
//                            .font(.custom("Poppins-Regular", size: 16))
//                            .foregroundColor(Color("roxo"))
//                            .fontWeight(.semibold)
//                            .underline()
//                            .padding(.trailing, UIScreen.main.bounds.width*0.75)
//                    })
                    
                    // Chama a função starPlayback do audioPlayer
                    Button(action: {
                        print("apertou botão de som")
                        modificarSom()
                    }, label: {
                        Image(systemName: buttonImageName)
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
        .onAppear(perform: {
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "vassourinhas")
        })
        .background(
                    Image("bg_launchscreen")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                )
        
    }
    
    func modificarSom(){
        self.isPlaying.toggle()
        
        if (isPlaying){
            self.buttonImageName = "speaker.wave.2.fill"
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "vassourinhas")
        } else {
            self.buttonImageName = "speaker.slash.fill"
            MusicPlayer.shared.stopBackgroundMusic()
        }
        
    }

}

struct Launchscreen_Previews: PreviewProvider {
    static var previews: some View {
        Launchscreen(viewRouter: ViewRouter())
    }
}
