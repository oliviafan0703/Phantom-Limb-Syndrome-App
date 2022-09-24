//
//  GameSystem.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/20/21.
//

import SwiftUI

struct GameSystem: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("PhantomRehab").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
                Spacer()
                
                //Beginner
                NavigationLink(
                    destination: Beginner(),
                    label: {
                        Image("beginner").position(x:190,y:180)
                    })
                //Intermediate
                NavigationLink(
                    destination: Intermediate(),
                    label: {
                        Image("intermediate").position(x:190,y:130)
                    })
                
                //Advanced
                NavigationLink(
                    destination: Hard(),
                    label: {
                        Image("advanced").position(x:190,y:80)
                    })
                
                //Return button
                NavigationLink(
                    destination: Home(),
                    label: {
                        Image("Goback")
                    })
                
                //setting, volume
                HStack{
                    Image("settings").resizable().frame(width: 32.0, height: 32.0)
                    //music Button
                    Button {
                        MusicPlayer.shared.playPauseMusic()
                    } label:{
                    Image("volume").resizable().frame(width: 32.0, height: 32.0)
                    }                }.offset(x:140)
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    struct GameSystem_Previews: PreviewProvider {
        static var previews: some View {
            GameSystem()
        }
    }
}
