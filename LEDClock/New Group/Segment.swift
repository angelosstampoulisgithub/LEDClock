//
//  Segment.swift
//  LEDClock
//
//  Created by Angelos Staboulis on 6/6/26.
//

import SwiftUI

struct Segment: View {
    let isOn: Bool
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: height / 2)
            .fill(isOn ? Color.red : Color.red.opacity(0.15))
            .frame(width: width, height: height)
            .shadow(color: isOn ? Color.red.opacity(0.7) : .clear,
                    radius: isOn ? 8 : 0)
    }
}
