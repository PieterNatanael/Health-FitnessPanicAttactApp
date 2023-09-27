//
//  ContentView.swift
//  PanicAttactApp
//
//  Created by Pieter Yoshua Natanael on 13/09/23.
//

import SwiftUI
import AVFoundation

extension Color {
    static let airbnbPink = Color(red: 255/255, green: 90/255, blue: 95/255)
}

extension Font {
    static func airbnbFont(size: CGFloat) -> Font {
        return Font.custom("AvenirNext-Bold", size: size)
    }
}

struct ContentView: View {
    @State private var isPanicMode = false
    @State private var audioPlayer: AVAudioPlayer?
    
    let panicText = "Excuse me, I am having a panic attack"
    
    var body: some View {
        VStack {
            if isPanicMode {
                Text(panicText)
                    .font(Font.airbnbFont(size: 64))
                    .foregroundColor(.airbnbPink)
                    .padding()
                
                Button(action: stopPanic) {
                    Text("I'm done")
                        .font(Font.airbnbFont(size: 28))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.airbnbPink)
                        .cornerRadius(10)
                }
                .padding()
            } else {
                Button(action: startPanic) {
                    Text("Start")
                        .font(Font.airbnbFont(size: 38))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.airbnbPink)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .onAppear {
            loadAudio()
        }
    }
    
    func loadAudio() {
        if let audioFilePath = Bundle.main.path(forResource: "music", ofType: "mp3") {
            let audioFileUrl = URL(fileURLWithPath: audioFilePath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioFileUrl)
            } catch {
                print("Error loading audio file: \(error)")
            }
        }
    }
    
    func startPanic() {
        isPanicMode = true
        playAudio()
    }
    
    func stopPanic() {
        isPanicMode = false
        stopAudio()
    }
    
    func playAudio() {
        audioPlayer?.play()
    }
    
    func stopAudio() {
        audioPlayer?.stop()
    }
}


struct PanicAttackAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


/*
 
 make some changes
 make another changes
 make antoher changes
 make another changes
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
