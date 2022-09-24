//
//  BeginnerRight.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/20/21.
//

import SwiftUI

struct BeginnerRight: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("PhantomRehab").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
                
                Spacer()
                //Oops... That’s wrong.
                Text("Oops... That’s wrong.").font(.custom("Nunito Regular", size: 36)).multilineTextAlignment(.center).offset(y:-100)
                
                //Try Again button
                NavigationLink(
                    destination: Beginner(),
                    label: {
                        Image("tryagain")
                    })
                //Return button
                NavigationLink(
                    destination: Beginner(),
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
                    }                }.offset(x:140)
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    struct BeginnerRight_Previews: PreviewProvider {
        static var previews: some View {
            BeginnerRight()
        }
    }
}
