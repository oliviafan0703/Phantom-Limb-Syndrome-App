//
//  ContentView.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/17/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                //navbar
                Text("PhantomRehab").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
                Spacer()
                
                //Sign In
                Text("Sign In").font(.custom("Nunito Regular", size: 40)).position(x:100,y:129)
                
                //Login: username
                ZStack{
                    Image("username")
                    Image("person-circle").resizable().frame(width: 32.0, height: 32.0).position(x:63,y:80)
                }
                
                //Login: password
                ZStack{
                    Image("EnterPassword")
                    Image("lock").resizable()
                        .frame(width: 32.0, height: 32.0).position(x:63,y:60)
                }
                
                //login Button
                NavigationLink(
                    destination: Home(),
                    label: {
                        Image("return")
                    })
                
                //Don’t have an account?
                Text("Don’t have an account?").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center)
                
                //Sign up
                NavigationLink(
                    destination: CreateAccount(),
                    label: {
                        Text("Sign up").font(.custom("Nunito Regular", size: 24)).underline().foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.22, blue: 0.96, alpha: 1))).multilineTextAlignment(.center)
                    })               
                
                HStack{
                    Button {
                        MusicPlayer.shared.stopBackgroundMusic()
                    } label:{
                        Image("settings").resizable().frame(width: 32.0, height: 32.0)
                    }

                    //Music Button
                    Button {
                        MusicPlayer.shared.startBackgroundMusic()
                    } label:{
                    Image("volume").resizable().frame(width: 32.0, height: 32.0)
                    }
                }.offset(x:140)
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            //Hide unwanted white space in navigationView
            Spacer()
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
