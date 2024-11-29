//
//  ContentView.swift
//  Stopwatch
//
//  Created by Denis Banach on 28.11.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timer:Timer?
    @State private var elapsedSeconds:Int = 0
    @State private var timerIsRunning:Bool = false
    
    @State private var seconds:Int = 0
    @State private var minutes:Int = 0
    @State private var hours:Int = 0
    
    
    
    var body: some View {
        
        var seconds: Int {
                elapsedSeconds % 60
            }
            var minutes: Int {
                (elapsedSeconds / 60) % 60
            }
            var hours: Int {
                elapsedSeconds / 3600
            }
        
        VStack {
            
//           Text("\(elapsedSeconds)")
//                .fontWeight(.bold)
//                .fontDesign(.monospaced)
//                .font(.custom("Arial",size: 40))
            
            Text(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
                .fontWeight(.bold)
                .fontDesign(.monospaced)
                .font(.custom("Arial",size: 40))
            
            
            
            
            Button(action: startAndStopTimer) {
              Label(
                timerIsRunning ? "Stop" : "Start",
                systemImage: timerIsRunning ? "stop.circle" : "play.circle"
              )
                .padding(12)
                .foregroundColor(.black)
                .background(.yellow,
                   in: RoundedRectangle(cornerRadius: 12))
            }
            
            if(!timerIsRunning && elapsedSeconds > 0) {
                Button(action: stopTimerAndReset) {
                  Text(
                    "Reset"
                  )
                    .padding(12)
                    .foregroundColor(.black)
                    .background(.yellow,
                       in: RoundedRectangle(cornerRadius: 12))
                }
            }
        }
        .padding()
    }
    
    private func startAndStopTimer() {
        if(timerIsRunning == false) {
            startTimer()
            timerIsRunning = true
        }else{
            stopTimer()
            timerIsRunning = false
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            elapsedSeconds+=1
        })
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func stopTimerAndReset() {
        stopTimer()
        elapsedSeconds = 0
    }
    
    private func getStartButtonText() -> String {
        var startButtonText = ""
        
        if(timerIsRunning == false) {
            startButtonText = "Start"
        }else{
            startButtonText = "Stop"
        }
        
        return startButtonText
    }
    
}

#Preview {
    ContentView()
}
