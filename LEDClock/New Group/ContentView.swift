//
//  ContentView.swift
//  LEDClock
//
//  Created by Angelos Staboulis on 6/6/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ClockViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.black, Color.gray.opacity(0.4)],
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            let components = viewModel.timeString.map { String($0) }
            
            HStack(spacing: 12) {
                ForEach(0..<components.count, id: \.self) { index in
                    let char = components[index]
                    
                    if char == ":" {
                        ColonView(isOn: true)
                    } else if let value = Int(char) {
                        SevenSegmentDigit(digit: value)
                            .frame(width: 40, height: 80)
                    }
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black.opacity(0.8))
                    .shadow(color: .red.opacity(0.4), radius: 20)
            )
        }
    }
}

#Preview {
    ContentView()
}
