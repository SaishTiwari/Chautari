//
//  ProfileView.swift
//  Chautari
//
//  Created by Saish Tiwari on 24/07/2024.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("fullname") var currentUserName : String?
    @AppStorage ("age") var currentUserAge : Int?
    @AppStorage ("gender") var currentUserGender : String?
    @AppStorage("signed_in") var currentusersignedin : Bool = false
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                
                    
                    
                    Text(currentUserName ?? "Your Name,")
                    
                Spacer()
                
                Text("About Me").font(.title).fontWeight(.semibold)
                
                
                
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Text("Sign Out".uppercased())
                    .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(width: 150, height: 40)
                    .background(Color.red)
                    .cornerRadius(10)
                    .onTapGesture {
                        SignOut()
                    }
                    .padding()
                
                
                  
            }
            
            .navigationBarItems(leading:Text("Profile").font(.title).fontWeight(.semibold) ,
                                trailing: Image(systemName: "gearshape.fill") )
            
            
        }
    }
}

#Preview {
    ProfileView()
}


extension ProfileView{
    
    func SignOut(){
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring){
            currentusersignedin = false
        }
        
        
    }
}
