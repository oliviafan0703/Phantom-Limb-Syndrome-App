//
//  meditation.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/20/21.
//

import SwiftUI

struct meditation: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("PhantomRehab").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
                Spacer()
                
                //Video
                ZStack {
                    Rectangle()
                    .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))

                    Rectangle()
                    .strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1)
                    //Video
                    Text("Video").font(.custom("Nunito Regular", size: 35)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center)
                }
                .frame(width: 375, height: 259)
                .offset(y:-130)
                
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
                    }                }.offset(x:140)
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    struct meditation_Previews: PreviewProvider {
        static var previews: some View {
            meditation()
        }
    }
}
