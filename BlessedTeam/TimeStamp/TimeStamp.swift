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

//KODINGAN YANG ADA DI MAIN VIEW, KODINGANNYA PUNYA MONICA
//                HStack {
//                    Text("Tap to time stamp")
//                    Text("0/6")
//                }
//                .bold()
//                .position(x: geometry.size.width/2 - 400, y: geometry.size.height/2 - 200)

//                List {
//                    Text("Can you describe any pain points or frustrations you experience while using the app?")
//                    Text("How frequently do you use this app, and in what contexts or situations?")
//                    Text("Are there any specific improvements or changes you would like to see in the app?")
//                    Text("Have you encountered any difficulties in understanding the app's navigation or menu structure?")
//                    Text("How do you feel about the visual design and aesthetics of the app?")
//                    Text("How do you feel about the visual design and aesthetics of the app?")
//                }
//                .scrollContentBackground(.hidden)
//                .frame(width: geometry.size.width * 0.5, height: 400)
//                .position(x: geometry.size.width/2 - 200, y: geometry.size.height/2 + 100)

//            VStack {
//                Text("Waveform View")
//                    .font(.title)
////                WaveformView(audioURL: /* URL rekaman suara */)
//                    .frame(height: 200)
//            }

//                Text("Timestamp")
//                //nanti ada list timestamp
//                    .bold()
//                    .position(x: geometry.size.width/2 + 250, y: geometry.size.height/2 - 150)

//                Text("Stamp Button")
//                    .bold()
//                    .position(x: geometry.size.width/2 + 250, y: geometry.size.height/2 - 50)
//
//                HStack {
//                    Button(action: {
//                        addTimestamp()
//
//                        // Tindakan yang akan dilakukan saat tombol ditekan
//                        print("Tombol ditekan")
//                    }) {
//                        HStack {
//                            Image("probing")
//                                .resizable()
//                                .frame(width: 32, height: 20)
//                            Text("PROBING")
//                                .foregroundColor(.black)
//                                .padding()
//                                .font(.system(size:12))
//                        }
//                        .frame(width: 145, height: 30)
//                        .background(
//                            Rectangle()
//                                .fill(Color.white)
//                                .cornerRadius(8)
//                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
//                        )
//                    }
//
//                    Button(action: {
//                        insightTimestamp()
//                        // Tindakan yang akan dilakukan saat tombol ditekan
//                        print("Tombol ditekan")
//                    }) {
//                        HStack {
//                            Image("insight")
//                                .resizable()
//                                .frame(width: 32, height: 20)
//                            Text("INSIGHT")
//                                .foregroundColor(.black)
//                                .padding()
//                                .font(.system(size:12))
//                        }
//                        .frame(width: 145, height: 30)
//                        .background(
//                            Rectangle()
//                                .fill(Color.white)
//                                .cornerRadius(8)
//                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
//                        )
//                    }
//                }
//                .position(x: geometry.size.width/2 + 350, y: geometry.size.height/2)
//
//                HStack {
//                    Button(action: {
//                        needTimestamp()
//                        // Tindakan yang akan dilakukan saat tombol ditekan
//                        print("Tombol ditekan")
//                    }) {
//                        HStack {
//                            Image("need")
//                                .resizable()
//                                .frame(width: 32, height: 20)
//                            Text("NEED")
//                                .foregroundColor(.black)
//                                .padding()
//                                .font(.system(size:12))
//                        }
//                        .frame(width: 145, height: 30)
//                        .background(
//                            Rectangle()
//                                .fill(Color.white)
//                                .cornerRadius(8)
//                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
//                        )
//                    }
//
//                    Button(action: {
//                        hopeTimestamp()
//                        // Tindakan yang akan dilakukan saat tombol ditekan
//                        print("Tombol ditekan")
//                    }) {
//                        HStack {
//                            Image("hope")
//                                .resizable()
//                                .frame(width: 32, height: 20)
//                            Text("HOPE")
//                                .foregroundColor(.black)
//                                .padding()
//                                .font(.system(size:12))
//                        }
//                        .frame(width: 145, height: 30)
//                        .background(
//                            Rectangle()
//                                .fill(Color.white)
//                                .cornerRadius(8)
//                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
//                        )
//                    }
//                }
//                .position(x: geometry.size.width/2 + 350, y: geometry.size.height/2 + 50)
//
//                HStack {
//                    Button(action: {
//                        motivationTimestamp()
//                        // Tindakan yang akan dilakukan saat tombol ditekan
//                        print("Tombol ditekan")
//                    }) {
//                        HStack {
//                            Image("motivation")
//                                .resizable()
//                                .frame(width: 32, height: 20)
//                            Text("MOTIVATION")
//                                .foregroundColor(.black)
//                                .padding()
//                                .font(.system(size:12))
//                        }
//                        .frame(width: 145, height: 30)
//                        .background(
//                            Rectangle()
//                                .fill(Color.white)
//                                .cornerRadius(8)
//                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
//                        )
//                    }
//
//                    Button(action: {
//                        disappointedTimestamp()
//                        // Tindakan yang akan dilakukan saat tombol ditekan
//                        print("Tombol ditekan")
//                    }) {
//                        HStack {
//                            Image("disappointed")
//                                .resizable()
//                                .frame(width: 32, height: 20)
//                            Text("DISAPPOINTED")
//                                .foregroundColor(.black)
//                                .padding()
//                                .font(.system(size:12))
//                        }
//                        .frame(width: 145, height: 30)
//                        .background(
//                            Rectangle()
//                                .fill(Color.white)
//                                .cornerRadius(8)
//                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
//                        )
//                    }
//                }
//                .position(x: geometry.size.width/2 + 350, y: geometry.size.height/2 + 100)
//
//                HStack {
//                    Button(action: {
//                        happyTimestamp()
//                        // Tindakan yang akan dilakukan saat tombol ditekan
//                        print("Tombol ditekan")
//                    }) {
//                        HStack {
//                            Image("happy")
//                                .resizable()
//                                .frame(width: 32, height: 20)
//                            Text("HAPPY")
//                                .foregroundColor(.black)
//                                .padding()
//                                .font(.system(size:12))
//                        }
//                        .frame(width: 145, height: 30)
//                        .background(
//                            Rectangle()
//                                .fill(Color.white)
//                                .cornerRadius(8)
//                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
//                        )
//                    }
//
//                    Button(action: {
//                        satisfiedTimestamp()
//                        // Tindakan yang akan dilakukan saat tombol ditekan
//                        print("Tombol ditekan")
//                    }) {
//                        HStack {
//                            Image("satisfied")
//                                .resizable()
//                                .frame(width: 32, height: 20)
//                            Text("SATISFIED")
//                                .foregroundColor(.black)
//                                .padding()
//                                .font(.system(size:12))
//                        }
//                        .frame(width: 145, height: 30)
//                        .background(
//                            Rectangle()
//                                .fill(Color.white)
//                                .cornerRadius(8)
//                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
//                        )
//                    }
//
//                }
//                .position(x: geometry.size.width/2 + 350, y: geometry.size.height/2 + 150)
//
//                HStack {
//                    Button(action: {
//                        confusedTimestamp()
//                        // Tindakan yang akan dilakukan saat tombol ditekan
//                        print("Tombol ditekan")
//                    }) {
//                        HStack {
//                            Image("confused")
//                                .resizable()
//                                .frame(width: 32, height: 20)
//                            Text("CONFUSED")
//                                .foregroundColor(.black)
//                                .padding()
//                                .font(.system(size:12))
//                        }
//                        .frame(width: 145, height: 30)
//                        .background(
//                            Rectangle()
//                                .fill(Color.white)
//                                .cornerRadius(8)
//                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
//                        )
//                    }
//
//                    Button(action: {
//                        frustrationTimestamp()
//                        // Tindakan yang akan dilakukan saat tombol ditekan
//                        print("Tombol ditekan")
//                    }) {
//                        HStack {
//                            Image("frustration")
//                                .resizable()
//                                .frame(width: 32, height: 20)
//                            Text("FRUSTRATION")
//                                .foregroundColor(.black)
//                                .padding()
//                                .font(.system(size:12))
//                        }
//                        .frame(width: 145, height: 30)
//                        .background(
//                            Rectangle()
//                                .fill(Color.white)
//                                .cornerRadius(8)
//                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
//                        )
//                    }
//                }
//                .position(x: geometry.size.width/2 + 350, y: geometry.size.height/2 + 200)

