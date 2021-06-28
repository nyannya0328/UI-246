//
//  LotationView.swift
//  UI-246
//
//  Created by nyannyan0328 on 2021/06/27.
//

import SwiftUI

struct LotationView: View {
    @State var currentTab = "p1"
    var body: some View {
        ZStack{
            
            
            GeometryReader{proxy in
                
                let size = proxy.size
                Image(currentTab)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(1)
                
                
                
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)
            .colorScheme(.dark)
            
            
            TabView(selection:$currentTab){
                
                
                ForEach(1...6,id:\.self){index in
                    
                    
                    CurrouselView(index: index)
                    
                    
                }
                
                
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
        }
    }
}

struct LotationView_Previews: PreviewProvider {
    static var previews: some View {
        LotationView()
    }
}
