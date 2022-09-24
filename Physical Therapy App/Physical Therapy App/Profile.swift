//
//  Profile.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/19/21.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack{
            //navbar
            Text("PhantomRehab").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
            Spacer()
            
            //My Profile
            Text("My Profile").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).position(x:170,y:114)
            
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
            
            //Return button
            NavigationLink(
                destination: Home(),
                label: {
                    Image("Goback")
                })

            HStack{
                Image("settings").resizable().frame(width: 32.0, height: 32.0)
                //music Button
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

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
