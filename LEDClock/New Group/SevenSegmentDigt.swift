//
//  SevenSegmentDigt.swift
//  LEDClock
//
//  Created by Angelos Staboulis on 6/6/26.
//

import SwiftUI
struct SevenSegmentDigit: View {
    let digit: Int
    
    private var segmentsOn: [Bool] {
        // a, b, c, d, e, f, g
        switch digit {
        case 0: return [true,  true,  true,  true,  true,  true,  false]
        case 1: return [false, true,  true,  false, false, false, false]
        case 2: return [true,  true,  false, true,  true,  false, true ]
        case 3: return [true,  true,  true,  true,  false, false, true ]
        case 4: return [false, true,  true,  false, false, true,  true ]
        case 5: return [true,  false, true,  true,  false, true,  true ]
        case 6: return [true,  false, true,  true,  true,  true,  true ]
        case 7: return [true,  true,  true,  false, false, false, false]
        case 8: return [true,  true,  true,  true,  true,  true,  true ]
        case 9: return [true,  true,  true,  true,  false, true,  true ]
        default: return [false, false, false, false, false, false, false]
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            let thickness = h * 0.12
            
            ZStack {
                // a (top)
                Segment(isOn: segmentsOn[0],
                        width: w * 0.6,
                        height: thickness)
                    .position(x: w / 2, y: thickness)
                
                // d (bottom)
                Segment(isOn: segmentsOn[3],
                        width: w * 0.6,
                        height: thickness)
                    .position(x: w / 2, y: h - thickness)
                
                // g (middle)
                Segment(isOn: segmentsOn[6],
                        width: w * 0.6,
                        height: thickness)
                    .position(x: w / 2, y: h / 2)
                
                // f (top-left)
                Segment(isOn: segmentsOn[5],
                        width: thickness,
                        height: h * 0.35)
                    .position(x: w * 0.2, y: h * 0.25)
                
                // e (bottom-left)
                Segment(isOn: segmentsOn[4],
                        width: thickness,
                        height: h * 0.35)
                    .position(x: w * 0.2, y: h * 0.75)
                
                // b (top-right)
                Segment(isOn: segmentsOn[1],
                        width: thickness,
                        height: h * 0.35)
                    .position(x: w * 0.8, y: h * 0.25)
                
                // c (bottom-right)
                Segment(isOn: segmentsOn[2],
                        width: thickness,
                        height: h * 0.35)
                    .position(x: w * 0.8, y: h * 0.75)
            }
        }
    }
}
