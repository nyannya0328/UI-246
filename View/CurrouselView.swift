//
//  CurrouselView.swift
//  UI-246
//
//  Created by nyannyan0328 on 2021/06/27.
//

import SwiftUI

struct CurrouselView: View {
    var index : Int
    @State var offset : CGFloat = 0
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            ZStack{
                
              
                
                
                Image("p\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 10, height: size.height / 1.3)
                    .cornerRadius(10)
                
                
                VStack{
                    
                    VStack(alignment:.leading,spacing: 10){
                        
                        Text("Human Intergration Super Biser")
                            .font(.title.bold())
                            .kerning(1.3)
                            .foregroundStyle(.white)
                        
                        Text("Animal is Amazing")
                            .font(.title2.italic())
                            .foregroundStyle(.ultraThinMaterial)
                            
                        
                        
                    }
                    .padding(.top)
                    Spacer(minLength: 0)
                    
                    
                    
                    VStack(alignment:.leading,spacing: 10){
                        
                        
                        HStack{
                            
                            Image("pro")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            
                            
                            VStack(alignment:.leading,spacing:10){
                                
                                
                                Text("Cirl")
                                    .font(.footnote.monospacedDigit())
                                
                                
                                Text("Amazing Love")
                                    .font(.footnote)
                                
                                          
                                    
                                    
                                
                            }
                            .foregroundStyle(.black)
                            
                            
                            
                        }
                        
                        
                        HStack{
                            
                            VStack{
                                
                                Text("1300")
                                
                                
                                Text("Posts")
                                    .foregroundStyle(.secondary)
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack{
                                
                                Text("3100")
                                
                                
                                Text("Followers")
                                    .foregroundStyle(.secondary)
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                            VStack{
                                
                                Text("2000")
                                
                                
                                Text("Following")
                                    .foregroundStyle(.secondary)
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                        }
                        .padding(.horizontal)
                        
                        
                    }
                    .padding(.top,15)
                    .padding(.horizontal,20)
                    .background(Color.white,in: RoundedRectangle(cornerRadius: 5))
                    
                    
                }
                
            }
            .frame(width: size.width - 10, height: size.height / 1.3)
            .frame(width: size.width, height: size.height)
            
        }
        .tag("p\(index)")
        
        .rotation3DEffect(.init(degrees: getProgress() * 90), axis: (x: 0, y: 1, z: 0), anchor: offset > 0 ? .leading : .trailing, anchorZ: 0, perspective: 0.6)
        
        
     
        
        .modifier(ScrollViewOffsetModifier(anchourpoint: .leading, offset: $offset))
        
    }
    
    func getProgress()->CGFloat{
        
        let porgress = -offset / UIScreen.main.bounds.width
        
        return porgress
        
        
    }
    
    
}

struct CurrouselView_Previews: PreviewProvider {
    static var previews: some View {
        LotationView()
    }
}


