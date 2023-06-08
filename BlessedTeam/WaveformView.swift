////
////  WaveformView.swift
////  BlessedTeam
////
////  Created by Monica Butarbutar on 08/06/23.
////
//
//import SwiftUI
//import AVFoundation
//
//struct WaveformView: View {
//    var audioURL: URL
//    
//    var body: some View {
//        GeometryReader { geometry in
//            Path { path in
//                let waveform = generateWaveform(from: audioURL, size: geometry.size)
//                
//                for (index, amplitude) in waveform.enumerated() {
//                    let x = CGFloat(index) * geometry.size.width / CGFloat(waveform.count)
//                    let y = geometry.size.height / 2 + amplitude * geometry.size.height / 2
//                    let point = CGPoint(x: x, y: y)
//                    
//                    if index == 0 {
//                        path.move(to: point)
//                    } else {
//                        path.addLine(to: point)
//                    }
//                }
//            }
//            .stroke(Color.blue, lineWidth: 1)
//        }
//    }
//    
//    private func generateWaveform(from audioURL: URL, size: CGSize) -> [CGFloat] {
//        // Membaca data amplitudo dari rekaman suara
//        guard let audioFile = try? AVAudioFile(forReading: audioURL) else { return [] }
//        let audioFormat = audioFile.processingFormat
//        let audioFrameCount = UInt32(audioFile.length)
//        let audioBuffer = AVAudioPCMBuffer(pcmFormat: audioFormat, frameCapacity: audioFrameCount)
//        try? audioFile.read(into: audioBuffer!)
//        
//        // Menghitung rata-rata amplitudo pada setiap frame
//        let samples = UnsafeBufferPointer(start: audioBuffer?.floatChannelData?[0], count: Int(audioBuffer?.frameLength ?? 0))
//        let sampleCount = samples.count
//        let frameCount = Int(size.width)
//        let framesPerSample = sampleCount / frameCount
//        
//        var waveform: [CGFloat] = []
//        
//        for frameIndex in 0..<frameCount {
//            let startSampleIndex = frameIndex * framesPerSample
//            let endSampleIndex = startSampleIndex + framesPerSample
//            
//            let frameSamples = samples[startSampleIndex..<endSampleIndex]
//            let averageAmplitude = frameSamples.reduce(0, +) / CGFloat(framesPerSample)
//            
//            waveform.append(averageAmplitude)
//        }
//        
//        return waveform
//    }
//}
//
