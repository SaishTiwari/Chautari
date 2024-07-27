//
//  HomePage.swift
//  Chautari
//
//  Created by Saish Tiwari on 24/07/2024.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        
        
        
        
        
        TabView{
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill").accentColor(.blue)
                    Text("Profile")
                }
            
            Text("Recomendation Page")
                .tabItem {
                    Image(systemName: "medal.fill")
                    Text("For You")
                }
            
            PookiesPage()
                .tabItem {
                    Image(systemName: "binoculars.circle.fill")
                    Text("Pookies")
                }
            
            
            
            
            
            
            Text("Interested in you")
            
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Admirers")
                    
                }
            
            
            
            Text("Messages will be show here")
                .tabItem {
                    Image(systemName: "bubble.fill").accentColor(.red).foregroundColor(.red)
                    Text("Whisper")
                    
                    
                    
                }
        }.accentColor(.red)
    }
}

#Preview {
    HomePage()
}
