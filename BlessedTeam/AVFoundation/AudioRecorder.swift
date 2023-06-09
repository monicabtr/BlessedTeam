//
//  AudioRecorder.swift
//  BlessedTeam
//
//  Created by Wahyu Nicola on 09/06/23.
//


import Foundation
import AVFoundation

class AudioRecorder: NSObject, ObservableObject, AVAudioRecorderDelegate {
    var audioRecorder: AVAudioRecorder!
    @Published var recording = false
    var isPaused = false
    var currentRecordingURL: URL?
    
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.wav")
        
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        if let currentURL = currentRecordingURL {
            // Rekaman sebelumnya ada, lanjutkan rekaman sebelumnya
            if isPaused {
                audioRecorder.record()
                isPaused = false
            } else {
                do {
                    audioRecorder = try AVAudioRecorder(url: currentURL, settings: settings)
                    audioRecorder.delegate = self
                    audioRecorder.record()
                    recording = true
                } catch {
                    print("Recording failed")
                }
            }
        } else {
            // Mulai rekaman baru
            do {
                audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.prepareToRecord()
                audioRecorder.record()
                recording = true
                currentRecordingURL = audioFilename
            } catch {
                print("Recording failed")
            }
        }
    }
    
    func pauseRecording() {
        if audioRecorder.isRecording {
            audioRecorder.pause()
            isPaused = true
        }
        recording = false
    }
    
    func stopRecording() {
        audioRecorder.stop()
        recording = false
        currentRecordingURL = nil
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            print("Recording failed")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}
