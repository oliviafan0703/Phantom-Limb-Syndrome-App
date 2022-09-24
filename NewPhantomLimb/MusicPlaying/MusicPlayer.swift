//
//  MusicPlayer.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 8/1/21.
//

import Foundation
import AVFoundation

class MusicPlayer {
    //property that makes this singleton class (only one instance of it, prevents double background music from playing
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?
    var music = "BackgroundMusic"
    
    let userDefaults = UserDefaults()
    
    func startBackgroundMusic() {
        if let value = userDefaults.value(forKey: "saveMusic") as? String{
            music = value
        }
        if let bundle = Bundle.main.path(forResource: music, ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                //audioPlayer.numberOfLoops = -1
                //audioPlayer.prepareToPlay()
                audioPlayer.play()
                //playPauseMusic()
            } catch {
                print(error)
            }
        }
    }
    
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
    
    func playPauseMusic(){
        guard let audioPlayer = audioPlayer else { return }
        if (audioPlayer.isPlaying) {
            audioPlayer.pause()
        }
        else {
            audioPlayer.play()
        }
    }
}
