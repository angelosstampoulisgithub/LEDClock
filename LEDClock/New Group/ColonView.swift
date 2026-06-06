//
//  ColonView.swift
//  LEDClock
//
//  Created by Angelos Staboulis on 6/6/26.
//

import SwiftUI

struct ColonView: View {
    let isOn: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Circle()
                .fill(isOn ? Color.red : Color.red.opacity(0.15))
                .frame(width: 10, height: 10)
                .shadow(color: isOn ? Color.red.opacity(0.7) : .clear,
                        radius: isOn ? 6 : 0)
            Circle()
                .fill(isOn ? Color.red : Color.red.opacity(0.15))
                .frame(width: 10, height: 10)
                .shadow(color: isOn ? Color.red.opacity(0.7) : .clear,
                        radius: isOn ? 6 : 0)
        }
    }
}
