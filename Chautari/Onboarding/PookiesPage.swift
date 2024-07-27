//
//  PookiesPage.swift
//  Chautari
//
//  Created by Saish Tiwari on 24/07/2024.
//

import SwiftUI

struct PookiesPage: View {
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                
                
                Image("Jassita").resizable().frame(maxWidth: .infinity).frame(height: 550).cornerRadius(20).padding(.all,5).scaledToFit().padding(.top,20).padding(.horizontal,10)
                
                
                Text("Jassita, 23").font(.title).fontWeight(.semibold)
                    .padding(.horizontal)
                
                HStack(spacing: 40){
                    
                    Image(systemName: "heart.circle.fill").resizable().frame(width: 60, height: 60)
                    
                    Image(systemName: "star.circle.fill").resizable().frame(width: 60, height: 60)
                    
                    Image(systemName: ("text.bubble")).resizable().frame(width: 60, height: 60)

                    
                    Image(systemName: ("x.circle.fill")).resizable().frame(width: 60, height: 60)

                }.padding(.horizontal)
                
                
                Text("About Me:").font(.title2).fontWeight(.semibold).padding().frame(maxWidth: .infinity, alignment: .leading)
                
                
                
                
                
                
                    .navigationBarItems(leading: Text("चौतारी").font(.largeTitle).fontWeight(.bold),
                                        trailing: Image(systemName: "ellipsis"))
                
            }
        }
    }
}

#Preview {
    PookiesPage()
}
