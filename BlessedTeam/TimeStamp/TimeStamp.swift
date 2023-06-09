//
//  MainView.swift
//  BlessedTeam
//
//  Created by Wahyu Nicola on 09/06/23.
//

//
//  MainView.swift
//  EightJune
//
//  Created by Wahyu Nicola on 08/06/23.
//

import SwiftUI
import AVFoundation


struct TimeStamp: View {
    @State private var timer: Timer?
    @State private var elapsedTime: TimeInterval = 0
    @State private var isTimerRunning = false
    @State private var timestamps: [String] = []
    @StateObject var audioPlayer = AudioPlayer()
    @StateObject var audioRecorder = AudioRecorder()
    ///Tambahan
    
    var body: some View {
        VStack {
            
            Text(timeFormatted(elapsedTime))
                .font(.system(size: 60))
                .padding()
            
            Text("Timestamps:")
                .font(.headline)
                .padding()
            
            List(timestamps, id: \.self) { timestamp in
                Text(timestamp)
                    .font(.subheadline)
            }
            .padding()
            
            HStack{
                
                
            }
            List(audioPlayer.recordings, id: \.self) { recordingURL in
                Button(action: {
                    self.audioPlayer.playAudio(url: recordingURL)
                }) {
                    Text(recordingURL.lastPathComponent)
                }
            }
            
            HStack {
                
                Button(action: {
                    finishTimer()
                    audioRecorder.stopRecording()
                    
                }) {
                    Text("Finish")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.red)
                        .cornerRadius(25)
                }
                .padding()
                
                Button(action: {
                    audioRecorder.startRecording()
                    toggleTimer()
                    
                }) {
                    Text(isTimerRunning ? "Pause" : "Start")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.blue)
                        .cornerRadius(25)
                }
                .padding()
                
                Button(action: {
                    addTimestamp()
                }) {
                    Text("Probing")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                    
                }
                .padding()
                
                Button(action: {
                    insightTimestamp()
                }) {
                    Text("Insight")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                    
                }
                .padding()
                
                
                
            }
            
            
            HStack {
                Button(action: {
                    needTimestamp()
                }) {
                    Text("Need")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                    
                }
                .padding()
                
                Button(action: {
                    hopeTimestamp()
                }) {
                    Text("Hope")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                    
                }
                .padding()
                
                Button(action: {
                    motivationTimestamp()
                }) {
                    Text("Motivation")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                    
                }
                .padding()
                
                Button(action: {
                    happyTimestamp()
                }) {
                    Text(" Happy")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                    
                }
                .padding()
                
                Button(action: {
                    satisfiedTimestamp()
                }) {
                    Text("Satisfied")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                    
                }
                .padding()
                
                
                
            }
            HStack {
                Button(action: {
                    satisfiedTimestamp()
                }) {
                    Text("Satisfied")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                    
                }
                .padding()
                
                Button(action: {
                    confusedTimestamp()
                }) {
                    Text("Confused")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                    
                }
                .padding()
                
                Button(action: {
                    frustrationTimestamp()
                }) {
                    Text("Frustration")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                    
                }
                .padding()
                
                Button(action: {
                    disappointedTimestamp()
                }) {
                    Text("Disappointed")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                    
                }
                .padding()
                
            }
        }
    }
    
    
    
    
    private func toggleTimer() {
        isTimerRunning.toggle()
        
        if isTimerRunning {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                elapsedTime += 1
            }
        } else {
            timer?.invalidate()
            timer = nil
        }
    }
    
    private func finishTimer() {
        timer?.invalidate()
        timer = nil
        elapsedTime = 0
        isTimerRunning = false
    }
    
    private func addTimestamp() {
        let timestamp = timeFormatted(elapsedTime)
        
        timestamps.append(timestamp + "  Probing")
    }
    
    private func insightTimestamp() {
        let timestamp = timeFormatted(elapsedTime)
        
        timestamps.append(timestamp + "  Insight")
    }
    
    private func needTimestamp() {
        let timestamp = timeFormatted(elapsedTime)
        
        timestamps.append(timestamp + "  Need")
    }
    
    private func hopeTimestamp() {
        let timestamp = timeFormatted(elapsedTime)
        
        timestamps.append(timestamp + "  hope")
    }
    
    private func motivationTimestamp() {
        let timestamp = timeFormatted(elapsedTime)
        
        timestamps.append(timestamp + "  Motivation")
    }
    
    private func happyTimestamp() {
        let timestamp = timeFormatted(elapsedTime)
        
        timestamps.append(timestamp + "  Happy")
    }
    
    private func satisfiedTimestamp() {
        let timestamp = timeFormatted(elapsedTime)
        
        timestamps.append(timestamp + "  Satisfied")
    }
    
    private func confusedTimestamp() {
        let timestamp = timeFormatted(elapsedTime)
        
        timestamps.append(timestamp + "  Confused")
    }
    
    private func frustrationTimestamp() {
        let timestamp = timeFormatted(elapsedTime)
        
        timestamps.append(timestamp + "  Frustration")
    }
    
    private func disappointedTimestamp() {
        let timestamp = timeFormatted(elapsedTime)
        
        timestamps.append(timestamp + "  disappointed")
    }
    
    
    private func timeFormatted(_ timeInterval: TimeInterval) -> String {
        let hours = Int(timeInterval) / 3600
        let minutes = (Int(timeInterval) % 3600) / 60
        let seconds = (Int(timeInterval) % 3600) % 60
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct TimeStampView: View {
    var body: some View {
        TimeStamp()
    }
}




struct TimeStamp_Previews: PreviewProvider {
    static var previews: some View {
        TimeStamp()
            .previewInterfaceOrientation(.landscapeRight)
    }
}


