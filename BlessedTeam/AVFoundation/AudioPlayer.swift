//
//  AudioPlayer.swift
//  BlessedTeam
//
//  Created by Wahyu Nicola on 09/06/23.
//

import Foundation
import AVFoundation

class AudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer!
    @Published var isPlaying = false
    @Published var recordings: [URL] = []
    
    override init() {
        super.init()
        fetchRecordings()
    }
    
    func fetchRecordings() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        do {
            let urls = try FileManager.default.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
            
            self.recordings = urls.filter { $0.pathExtension == "wav" }
        } catch {
            print("Failed to fetch recordings")
        }
    }
    
    func playAudio(url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            isPlaying = true
        } catch {
            print("Playback failed")
        }
    }
    //bikin function play audio baru yang parameternya url dan waktu
    
    func pause() {
        audioPlayer.pause()
        isPlaying = false
    }
    
    func play() {
        audioPlayer.play()
        isPlaying = true
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
    }
    
    
    


}
