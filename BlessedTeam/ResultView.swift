//
//  ResultView.swift
//  BlessedTeam
//
//  Created by Wahyu Nicola on 09/06/23.
//

import SwiftUI
import AVFoundation

struct ResultView: View {
    @State private var timer: Timer?
    @State private var elapsedTime: TimeInterval = 0
    @State private var isTimerRunning = false
    @State private var timestamps: [String] = []
    @StateObject var audioPlayer = AudioPlayer()
    @StateObject var audioRecorder = AudioRecorder()
    
    var body: some View {
        
        Text("Ini Result View")
        List(audioPlayer.recordings, id: \.self) { recordingURL in
            Button(action: {
                self.audioPlayer.playAudio(url: recordingURL)
            }) {
                Text(recordingURL.lastPathComponent)
            }
        }
        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
