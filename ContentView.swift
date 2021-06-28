//
//  ContentView.swift
//  UI-246
//
//  Created by nyannyan0328 on 2021/06/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashScreen(imagesize:CGSize(width: 500, height: 500)){
            
            
            Home()
            
        } titleView: {
            Text("Chatty")
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(.white)
            
        } logoView: {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
               
            
            
        } navbutton: {
            
            Image("pro")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
        
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
