//
//  StartScreenView.swift
//  NekoTime
//
//  Created by Hadi Al zayer on 27/11/1446 AH.
//

import SwiftUI


///Timer length selection and start button

struct StartScreenView: View {
    @State private var selectedMinutes: Int = 25
    let options = [5, 10, 15, 25, 45, 60]

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("⏳ Choose Focus Time")
                    .font(.title2)
                    .fontWeight(.bold)

                Picker("Time", selection: $selectedMinutes) {
                    ForEach(options, id: \.self) { minute in
                        Text("\(minute) min")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 150)

                NavigationLink(destination: FocusScreenView(time: selectedMinutes)) {
                    Text("Start Focus")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    StartScreenView()
}
