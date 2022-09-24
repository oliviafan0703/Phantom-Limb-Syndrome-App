//
//  CreateAccount.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/20/21.
//

import SwiftUI

struct CreateAccount: View {
    var body: some View {
        VStack{
            //navbar
            Text("PhantomRehab").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
            Spacer()
            
            //Create Account
            Text("Create Account").font(.custom("Nunito Regular", size: 36)).multilineTextAlignment(.center).offset(y:30)
            
            //Username
            HStack{
                Image("person-circle").resizable().frame(width: 32.0, height: 32.0).position(x:63,y:80)
                Text("Username").font(.custom("Raleway Regular", size: 22)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6))).position(x:-10, y:80)
            }
            //Email
            HStack{
                Image("envelope").resizable().frame(width: 32.0, height: 32.0).position(x:63,y:80)
                Text("Email").font(.custom("Raleway Regular", size: 22)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6))).position(x:-10, y:70)
                
            }
            //Password
            HStack{
                Image("lock").resizable()
                    .frame(width: 32.0, height: 32.0).position(x:63,y:60)
                Text("Password").font(.custom("Raleway Regular", size: 22)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6))).position(x:-10, y:60)
            }
            
            //Password again
            HStack{
                Image("lock").resizable()
                    .frame(width: 32.0, height: 32.0).position(x:63,y:60)
                Text("Confirm Password").font(.custom("Raleway Regular", size: 22)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6))).position(x:20, y:60)
            }
            
            //Signup button
            NavigationLink(
                destination: ContentView(),
                label: {
                    Image("signup")
                })

            HStack{
                Image("settings").resizable().frame(width: 32.0, height: 32.0)
                //Music Button
                Button {
                    MusicPlayer.shared.playPauseMusic()
                } label:{
                Image("volume").resizable().frame(width: 32.0, height: 32.0)
                }
            }.offset(x:140)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount()
    }
}
