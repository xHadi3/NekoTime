//
//  FocusScreenView.swift
//  NekoTime
//
//  Created by Hadi Al zayer on 27/11/1446 AH.
//

import SwiftUI


/// show timer countdown and cat animation


    struct FocusScreenView: View {
        let time: Int // in minutes

        @State private var remainingSeconds: Int = 0
        @State private var timer: Timer? = nil
        @State private var isRunning = true

        var body: some View {
            VStack(spacing: 30) {
                Text("Stay Focused!")
                    .font(.title)
                    .fontWeight(.bold)

                Text(timeString(from: remainingSeconds))
                    .font(.system(size: 48, weight: .semibold, design: .monospaced))
                HStack{
                    Button("Cancel") {
                        timer?.invalidate()
                        // You can add navigation logic here if needed
                    }.foregroundColor(.red)
                    
                    Button(isRunning ? "Pause" : "Resume"){
                        isRunning.toggle()
                    }
                    .disabled(remainingSeconds == 0)
                }
               
                
            }
            .padding()
            .onAppear {
                remainingSeconds = time * 60
                startTimer()
            }
            .onDisappear {
                timer?.invalidate()
            }
        }

        func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
                if isRunning && remainingSeconds > 0 {
                    remainingSeconds -= 1
                } else if remainingSeconds == 0 {
                   timer?.invalidate()
                    // Handle when time is up
                }
            }
        }

        func timeString(from seconds: Int) -> String {
            let minutes = seconds / 60
            let secs = seconds % 60
            return String(format: "%02d:%02d", minutes, secs)
        }
    }

#Preview {
    FocusScreenView(time: 1)
}
