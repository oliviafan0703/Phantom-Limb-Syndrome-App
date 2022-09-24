//
//  ProviderSignIn.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/3/21.
//

import SwiftUI

struct ProviderSignIn: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
            
            VStack{
                
                GeometryReader { geometry in
                    let deepBlue = Color(red:73/255, green:151/255, blue:208/255)
                    VStack{
                        
                        //PhantomRehab bar
                        ZStack{
                            HStack{
                                Text("PhantomRehab")
                                    .font(.custom("Raleway SemiBold", size: 27)).offset(x:20)
                                
                                //music
                                Image("volume").offset(x:25)
                            }
                        }.frame(width: geometry.size.width, height:geometry.size.height/8).background(Rectangle().fill(deepBlue))
                        
                        HStack{
                            Image("providerImage").offset(x:30)
                            //Link to patient login
                            NavigationLink(
                                destination: ContentView(),
                                label: {
                                    Image("patientPage")
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)                        }).offset(x:60, y:-80)
                            
                        }.frame(width: geometry.size.width, height: geometry.size.height/4)
                        
                        Image("providerText").offset(x:-70)
                        
                        Spacer()
                        //username
                        ZStack{
                            Image("EnterUsername")
                            TextField("Enter username", text: self.$username)
                                .font(.custom("Raleway SemiBold", size: 15))
                                .offset(x:120)
                        }
                                                
                        ZStack{
                            Image("EnterPassword")
                            SecureField("Enter password", text: self.$password)
                                .font(.custom("Raleway SemiBold", size: 15))
                                .offset(x:120)
                        }
                        
                        //Login button
                        NavigationLink(
                            destination: Therapy(),
                            label: {
                                Image("Login")
                            })
                        
                        //places tab bar at bottom
                        Spacer()
                
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            //background color
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("lightBlue")).ignoresSafeArea()
        }
    }
    
    struct ProviderSignIn_Previews: PreviewProvider {
        static var previews: some View {
            ProviderSignIn()
        }
    }
}
