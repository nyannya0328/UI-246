//
//  Home.swift
//  UI-246
//
//  Created by nyannyan0328 on 2021/06/27.
//

import SwiftUI

struct Home: View {
    
    @State var selected = "All Photo"
    @Namespace var animation
    var body: some View {
        VStack(spacing:0){
            
            
            HStack(spacing:0){
                
                TabButton(title: "All Photo", selected: $selected, animation: animation)
                TabButton(title: "Chat", selected: $selected, animation: animation)
                
                TabButton(title: "Settings", selected: $selected, animation: animation)
                
                TabButton(title: "Map", selected: $selected, animation: animation)
                
                
            
                
                
                
            }
            .padding(.top,20)
            .background(Color("c1"))
            
            
                switch selected{
                case "All Photo" :
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(spacing:15){
                            
                            
                            ForEach(1...6,id:\.self){index in
                                
                                
                                Image("p\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                                    .cornerRadius(10)
                                
                                
                            }
                            
                            
                        }
                        .padding(15)
                        
                    }
                    
                    
                case "Chat" : LotationView()
                case "Settings" :WaveScreen()
                    
                case "Map" : MapView()
                default : Text("")
                    
                    
                    
                    
                }
          
            
            
           
        }
        //.background(.quaternary)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TabButton : View{
    
    
    var title : String
    @Binding var selected : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button {
            withAnimation{
                
                selected = title
                
            }
        } label: {
            
            VStack{
                
                
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                
                ZStack{
                    
                    if selected == title{
                        
                        Capsule()
                            .fill(Color.green)
                            .frame(height: 3.5)
                            .shadow(radius: 20)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                        
                        
                    }
                    
                    else{
                        
                        Capsule()
                            .fill(Color.clear)
                            .frame(height: 3.5)
                        
                        
                    }
                    
                    
                }
            }
            
        }

        
        
    }
}
