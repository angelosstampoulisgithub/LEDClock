//
//  ClockViewModel.swift
//  LEDClock
//
//  Created by Angelos Staboulis on 6/6/26.
//

import Foundation
import SwiftUI
import Combine

class ClockViewModel: ObservableObject {
    @Published var timeString: String = ""
    
    private var timerCancellable: AnyCancellable?
    private let formatter: DateFormatter
    
    init() {
        formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        
        updateTime()
        
        timerCancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateTime()
            }
    }
    
    private func updateTime() {
        timeString = formatter.string(from: Date())
    }
}
