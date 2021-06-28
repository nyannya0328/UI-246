//
//  WaveScreen.swift
//  UI-246
//
//  Created by nyannyan0328 on 2021/06/27.
//

import SwiftUI

var gra = LinearGradient(colors: [.red,.green], startPoint: .leading, endPoint: .trailing)
struct WaveScreen: View {
    
    @State var on = false
    var body: some View {
        ZStack{
            
            Waveform(color: .blue, amifity: 200, isreveced: true)
            Waveform(color: (on ? .red : .green), amifity: 200, isreveced: false)
            
            
            VStack{
                
                HStack{
                    
                    
                    Text("WAVE")
                         .font(.largeTitle.italic())
                         .foregroundStyle(.primary)
                     
                     
                     Spacer(minLength: 0)
                     
                     
                     Toggle(isOn: $on) {
                         
                         VStack(spacing:10){
                             
                             Text("Push me")
                                 .font(.footnote.italic())
                                 .foregroundColor(.primary)
                             
                             
                             Image(systemName: "eyedropper.full")
                                 .font(.title3.bold())
                                     .foregroundColor(.primary)
                                 
                         }
                       
                         
                         
                         
                         
                     }
                   
                     .tint(.purple)
                     .toggleStyle(.button)
                    
                    
                         
                }
                .padding([.horizontal,.top])
                
                
                
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
        }
        .background(gra)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct WaveScreen_Previews: PreviewProvider {
    static var previews: some View {
        WaveScreen()
    }
}

struct Waveform : View{
    
    var color : Color
    var amifity : CGFloat
    var isreveced : Bool
    var body: some View{
        
        
        TimelineView(.animation){timeline in
            
            Canvas{contex , size in
                
                let timenow = timeline.date.timeIntervalSinceReferenceDate
                
                
                let angle = timenow.remainder(dividingBy: 2)
                
                let offset = angle * size.width
                
                
                contex.translateBy(x: isreveced ? -offset : offset, y: 0)
                
                contex.fill(getPath(size: size), with: .color(color))
                
                
                contex.translateBy(x: -size.width, y: 0)
                contex.fill(getPath(size: size), with: .color(color))
                contex.translateBy(x: size.width * 2, y: 0)
                contex.fill(getPath(size: size), with: .color(color))
                
                
            }
            
            
            
        }
        
    }
    
    func getPath(size : CGSize)->Path{
        
        
        
        return Path{path in
            
            
            
            let midHight = size.height / 2
            
            let with = size.width
            
            
            path.move(to: CGPoint(x: 0, y: midHight))
            
            path.addCurve(to: CGPoint(x: with, y: midHight), control1: CGPoint(x: with * 0.4, y: midHight + amifity ), control2: CGPoint(x: with * 0.65, y: midHight + amifity))
            
            
            
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            
            
            
            
            
            
        }
        
    }
}
