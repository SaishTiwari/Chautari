//
//  IntroView.swift
//  LearningUI
//
//  Created by Saish Tiwari on 22/07/2024.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("signed_in") var currentusersignedin : Bool = false
    var body: some View {
        ZStack{
            
            
            RadialGradient(colors: [
                               Color.red,
                               Color.pink,
                               Color.datingApp
                        
                           ],
                           center: .center,
                           startRadius: 100,
                           endRadius: 600)
            .ignoresSafeArea()
            if currentusersignedin{
                HomePage()
            }
            else{
                
                OnboardingView()
            }
            
        }
    }
}

#Preview {
    IntroView()
}
