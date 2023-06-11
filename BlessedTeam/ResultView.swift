//
//  ResultView.swift
//  BlessedTeam
//
//  Created by Wahyu Nicola on 09/06/23.
//

import SwiftUI
import AVFoundation

struct ResultView: View {
    @Binding var timestamps: [String]
    
    @State private var timer: Timer?
    @State private var elapsedTime: TimeInterval = 0
    @State private var isTimerRunning = false
    @StateObject var audioPlayer = AudioPlayer()
    @StateObject var audioRecorder = AudioRecorder()
    
    var body: some View {
        HStack {
            VStack {
                Text("Tap to go to the time you want")
                    .font(.system(size: 20, weight: .bold))
                List(timestamps, id: \.self) { timestamp in
                        Text(timestamp)
                            .font(.subheadline)
            }
            
            }

            
            
            VStack{
                Text("00:50:00")
                    .font(.system(size: 20, weight: .bold))
                Text("BAR REKAMAN")
                    .font(.system(size: 20, weight: .bold))
                Text("00:03:01")
                    .font(.system(size: 20, weight: .bold))
                List(audioPlayer.recordings, id: \.self) { recordingURL in
                    Button(action: {
                        self.audioPlayer.playAudio(url: recordingURL)
                    }) {
                        Text(recordingURL.lastPathComponent)
                    }
                }
                
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(timestamps: .constant(["00:00:00 "]))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
