//
//  AudioPlayer.swift
//  QuatroCantos
//
//  Created by Mayara Mendonça de Souza on 11/02/21.
//

import Foundation
import SwiftUI
import AVFoundation

class AudioPlayer: ObservableObject {
    
    // Esse atributo notifica views que o estão observando quando damos play/stip em um som
    @Published var isPlaying = false
    
    // Inicializa uma instância de AVAudioPlayer
    var audioPlayer: AVAudioPlayer!
    
    // Essa função toca o audio quando chamada
    func startPlayBack(fileName: String, fileExtension: String) {
        
        // Localizar o arquivo de audio
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("Arquivo de audio não encontrado")
            return
        }
        
        // Iniciar uma sessao de audio
//        let playbackSession = AVAudioSession.sharedInstance()
//        
//        // Saída de áudio
//        do {
//            try
//                playbackSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
//        } catch {
//            print("Não conseguiu tocar a música")
//        }
        
        // Tocar o som e notificar as views que estão observando
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
            isPlaying = true
        } catch {
            print("Playback falhou")
        }
        
    }
}

// Link do tutorial: https://www.facebook.com/BLCKBIRDSDEV/posts/how-to-play-sounds-in-swiftui-playing-your-own-sound-files-in-swiftui-is-pretty-/2297763250535318/
