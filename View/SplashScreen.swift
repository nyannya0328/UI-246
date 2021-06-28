//
//  SplashScreen.swift
//  UI-246
//
//  Created by nyannyan0328 on 2021/06/27.
//

import SwiftUI

struct SplashScreen<Content : View,TitleView : View,LogoView:View,NavButton : View>: View {
    
    var content : Content
    
    var titleView : TitleView
    
    var logoView : LogoView
    
    var navbutton : NavButton
    
    var imagesize : CGSize
    
    
    init(imagesize : CGSize, @ViewBuilder content:@escaping()->Content,@ViewBuilder titleView:@escaping()->TitleView,@ViewBuilder logoView:@escaping()->LogoView,@ViewBuilder navbutton:@escaping()->NavButton){
        
        
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
        self.navbutton = navbutton()
        self.imagesize = imagesize
        
        
        
    }
    
    @State var  textAnimation = false
    
    @State var  EndAnimation = false
    
    @State var showNavBar = false
    
    @Namespace var animation
    
    
    
   
    var body: some View {
        VStack(spacing:0){
            
            
            ZStack{
                
                Color("c1")
                
                    .background(Color("c1"))
                
                    .overlay(
                        ZStack{
                        
                        titleView
                                .scaleEffect(EndAnimation ? 0.75 : 1)
                                .offset(y:textAnimation ? -5 :  110)
                               
                            
                       
                            if !EndAnimation{

                                logoView
                                    .matchedGeometryEffect(id: "LOGO", in: animation)
                                    .frame(width: imagesize.width, height: imagesize.height)





                            }
                        
                    }
                    
                    )
                
                
                
                    .overlay(
                
                 
                    
                        
                        
                        HStack{
                            
                            navbutton
                                .opacity(showNavBar ? 1 : 0)
                            
                            Spacer()
                            
                            
                            if EndAnimation{
                                
                                logoView
                                    .matchedGeometryEffect(id: "LOGO", in: animation)
                                    .frame(width: 70, height: 70)
//                                    .padding(.trailing)
//                                    .offset(y: -5)
                            }
                        }
                        .padding(.horizontal)
                        
                        
                        
                        
                        
                   
                    
                    
                    
                    
                        
                )
                
               
                   
                
                
                
                
                
              
                
                
                
                
                
                
                
                
            }
            .frame(height: EndAnimation ? 50 : nil)
            .zIndex(1)
            
            content
                .frame(height: EndAnimation ? nil : 0)
                .zIndex(0)
            
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear {
            
            
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.4) {
                
                
                withAnimation(.spring()){
                    
                    textAnimation.toggle()
                    
                }
                
                withAnimation(Animation.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)){
                    
                    
                    withAnimation{
                        
                        EndAnimation.toggle()
                        
                    }
                    
                    DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.35) {
                        
                        withAnimation{
                            
                            showNavBar.toggle()
                        }
                    }
                    
                }
                
                
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
