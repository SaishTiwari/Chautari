//
//  OnboardingView.swift
//  LearningUI
//
//  Created by Saish Tiwari on 22/07/2024.
//

import SwiftUI

struct OnboardingView: View {
    /*
     Onboarding state:
     
     0 - Welcome Page
     1 - Name
     2 - Age
     3 - Gender
     
     */
    @State var onboardingstate : Int = 0
    
    @State var fullName : String = ""
    @State var age : Double = 50
    @State var gender :String =  ""
    
    //App Storage
    @AppStorage("fullname") var currentUserName : String?
    @AppStorage ("age") var currentUserAge : Int?
    @AppStorage ("gender") var currentUserGender : String?
    @AppStorage("signed_in") var currentusersignedin : Bool = false
    
    
    
    @State var showAlert : Bool = false
    

    @State var alertTitle : String = ""
    let transition : AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    var body: some View {
        ZStack{
            Spacer()
            ZStack{
                switch onboardingstate{
                case 0:
                    welcomeScreen
                        .transition(transition)
                    
                case 1:
                    namesection
                        .transition(transition)

                    
                case 2:
                    agesection
                        .transition(transition)

                    
                case 3:
                    genderSection                      .transition(transition)

                    
                    
                default:
                    Text("Hello")
                }
                
                
            }
            VStack{
                
                Spacer()
                Spacer()
                Spacer()
                
                loginRedirectory
                Spacer()
                bottombutton
                
                
                
                
                
            }
            
            
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle), dismissButton: .cancel(Text("OK")))
        })
        
      
    }
}

#Preview {
    OnboardingView().background(Color.purple)
}

extension OnboardingView{
    
    
    private var loginRedirectory : some View{
        
        VStack(spacing: -15) {
            
            
            
        }
        .padding(5)
    }
    
    
    
    
    
    
    
    private var bottombutton : some View{
        Text (onboardingstate == 0 ? "SIGN UP" : onboardingstate == 3 ? "FINISH" : "Next")
            .foregroundColor(.purple)
            .frame(maxWidth:.infinity )
            .frame(height: 55)
            .background(Color.white)
        
            .cornerRadius(10)
            .padding().padding(.horizontal,10)
            .onTapGesture {
                handleNextButton()
            }
        
    }
    private var welcomeScreen : some View{
        VStack(spacing:5){
            Spacer()
            Spacer()
            
            
            VStack (spacing: 20){
                Text("चौतारी").foregroundColor(.white)
                 //   .fontWeight(.semibold)
                    .font(.system(size: 70, weight: .heavy, design: .default))
                    
                    .padding(.bottom,-10)
                
            
                
                
                
                
                Text("Nepal's #1 dating app, where finding love comes with a smile!")
                    .padding(.horizontal)
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom,20)
                
                
            }
            
            
            Spacer()
            
            //  Text("Hello")
            Image(systemName: "tree.fill")
            
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 175)
                .foregroundColor(.green)
            
                .padding()
            
            Spacer()
            
            VStack(spacing:-20) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .padding().padding(.horizontal,20)
                    .overlay(HStack{
                        Image(systemName: "apple.logo").resizable().scaledToFit() .foregroundColor(.black).frame(width: 15)
                        Text("Continue with Apple").foregroundColor(.purple)
                        
                        
                    })
                
                
                
                RoundedRectangle(cornerRadius: 20).foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .padding().padding(.horizontal,20)
                    .overlay(HStack{
                        Image(systemName: "f.circle.fill").resizable().scaledToFit().foregroundColor(.white).frame(width: 15)
                        Text("Continue with Facebook").foregroundColor(.white)
                        
                        
                    })
                
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .padding().padding(.horizontal,20)
                    .overlay(HStack{
                        Image(systemName: "phone.circle.fill").resizable().scaledToFit().foregroundColor(.black).frame(width: 15)
                        Text("Use cell phone number").foregroundColor(.purple)
                        
                    })
            }
            
            
            
            
            Spacer()
            Spacer()
            
            
            
            
            
            
            
            
        }
    }
    
    
    private var namesection : some View{
        
        VStack(spacing:30){
            Spacer()
            Text("What's your name?")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            
            TextField("Enter your name", text: $fullName)
            
                .font(.headline)
                .frame(width: 350, height: 50)
            
            //.foregroundColor(.gray)
                .padding(.horizontal,10)
                .background(Color.white
                ).cornerRadius(10)
                .foregroundColor(.black)
            
            
            Spacer()
            Spacer()
        }
        
        
    }
    
    
    private var agesection : some View{
        VStack(spacing:30){
            
            Spacer()
            
            Text("What's your age?")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            
            
            
            Text( String(format: "%.0f", age)).font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            
            Slider(value: $age, in: 18...100, step: 1)
            
            
                .padding()
            
            
            Spacer()
            Spacer()
            
            
        }
    }
    
    
    
    
    private var genderSection: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("What's your gender?")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Picker("Choose a gender", selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non Binary").tag("Non Binary")
            }
            .pickerStyle(MenuPickerStyle())
            .foregroundColor(.white)
            .frame(width: 250, height: 45)
            .background(Color.purple)
            .cornerRadius(5)
            
            Spacer()
            Spacer()
            
        }
    }
    
    
    
}

        
        



//Functions:
extension OnboardingView{
    
    func handleNextButton(){
        
        switch onboardingstate{
        case 1:
            
            guard fullName.count > 3 else{
                alertTitle = "Your name must be atleast three characters long"
                showAlert.toggle()
                return
            }
            
            
            
            
        case 3:
            
            guard gender.count > 1 else{
                alertTitle = "You must select a gender"
                showAlert.toggle()
                return
            }
            
        default :
            break
            
        }
        
        if onboardingstate == 3{
            SignIn()
        }
        else{
            
            
            withAnimation(.spring()){
                onboardingstate += 1
            }
        }
    }

    
    func SignIn(){
       currentUserName = fullName
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring){
            currentusersignedin = true
       }
    }
    
    
    
}
