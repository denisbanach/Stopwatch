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
    
    var body: some View {
        
        VStack {
            
            Text("\(elapsedSeconds)")
                .fontWeight(.bold)
                .fontDesign(.monospaced)
                .font(.custom("Arial",size: 40))
            
            
            Button {
                startAndStopTimer()
            } label: {
                HStack{
                    Text(getStartButtonText())
                        .foregroundColor(.white)
                }.background(Color.accentColor)
                
            }
            .padding(5)
            
            Button(action: startAndStopTimer) {
              Label(getStartButtonText(), systemImage: "play.circle")
                .padding(12)
                .foregroundColor(.black)
                .background(.yellow,
                   in: RoundedRectangle(cornerRadius: 12))
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
