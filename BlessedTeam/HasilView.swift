import SwiftUI
import AVFoundation

class audioPlayer: ObservableObject {
    @Published var isPlaying = false
    var audioPlayer: AVAudioPlayer?
    
    func playAudio(url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            isPlaying = true
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    func pause() {
        audioPlayer?.pause()
        isPlaying = false
    }
}

struct HasilView: View {
    
    @Binding var timestamps: [String]
    @State private var timer: Timer?
    @State private var elapsedTime: TimeInterval = 0
    @State private var isTimerRunning = false
    @StateObject var audioPlayer = AudioPlayer()
    @StateObject var audioRecorder = AudioRecorder()
    @State private var currentTime: TimeInterval = 0
    @State private var selectedTime: TimeInterval = 0

    struct GreenButtonStyle: ButtonStyle {
        @State private var isPressed = false

        @State private var isButtonPressed = false
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(maxWidth: .infinity)
                .padding()
                .background(configuration.isPressed ? Color.green : Color.white)
                .foregroundColor(configuration.isPressed ? Color.white : Color.primary)
                .cornerRadius(15)
                .onTapGesture {
                    isPressed.toggle()
                }
        }
    }
    
    func playAudio(at time: TimeInterval) {
        // Panggil fungsi play audio berdasarkan waktu yang diberikan
    }

    var body: some View {
        
        
        HStack {
            VStack {
                Text("Tap to go to the time you want")
                    .font(.system(size: 20, weight: .bold))
                ForEach(timestamps, id: \.self) { timestamp in
                    Button(action: {
                        if let selectedTimestamp = convertTimestampToTimeInterval(timestamp) {
                            selectedTime = selectedTimestamp
                            playAudio(at: selectedTimestamp)
                        }
                    }) {
                        Text(timestamp)
                            .font(.subheadline)
                    }
                    .buttonStyle(GreenButtonStyle())
                }
            }

            VStack{
                
                
                Button(action: {
                                if let recordingURL = audioPlayer.recordings.first {
                                    if audioPlayer.isPlaying {
                                        audioPlayer.pause()
                                    } else {
                                        audioPlayer.playAudio(url: recordingURL)
                                    }
                                }
                            }) {
                                HStack {
                                    Image(systemName: audioPlayer.isPlaying ? "pause" : "play")
                                        .font(.title)
                                        .foregroundColor(.blue)
                                }
                            }
                
            }
            
        }
        Spacer()
    }

    func convertTimestampToTimeInterval(_ timestamp: String) -> TimeInterval? {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        guard let date = formatter.date(from: timestamp) else {
            return nil
        }
        return date.timeIntervalSince1970
    }
}

struct HasilView_Previews: PreviewProvider {
    static var previews: some View {
        HasilView(timestamps: .constant(["00:00:00 "]))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
