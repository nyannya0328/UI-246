//
//  ScrollViewOffsetModifier.swift
//  UI-246
//
//  Created by nyannyan0328 on 2021/06/27.
//

import SwiftUI

struct ScrollViewOffsetModifier: ViewModifier {
    var anchourpoint : Anchor = .top
    @Binding var  offset : CGFloat
    func body(content: Content) -> some View {
        content
            .overlay(
            
                GeometryReader{proxy -> Color in
                
                let frame = proxy.frame(in: .global)
                
                
                DispatchQueue.main.async {
                    
                    switch anchourpoint {
                    case .top:
                        offset = frame.midY
                    case .bottom:
                        offset = frame.maxY
                    case .trailing:
                        offset = frame.maxX
                    case .leading:
                        offset = frame.minX
                    }
                    
                }
                
                
                
                return Color.clear
            }
            
            )
    }
}



enum Anchor{
    
    case top
    case bottom
    case trailing
    case leading
}
