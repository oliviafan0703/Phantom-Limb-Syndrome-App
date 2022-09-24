//
//  Beginner.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/20/21.
//

import SwiftUI

struct Beginner: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("PhantomRehab").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
                Spacer()
                
                ZStack{
                    //level-bar
                    Rectangle()
                        .fill(Color(red:196/255,green:196/255,blue:196/255))
                        .frame(width: 375, height: 60)
                    HStack{
                        //Beginner
                        Text("Beginner").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center)
                        
                        //info button
                        NavigationLink(
                            destination: BeginnerInfo(),
                            label: {
                                Image("info-circle").resizable().frame(width: 35.0, height: 35.0)
                            })
                    }
                }.offset(y:-490)
                
                //Level 1
                Text("Level 1").font(.custom("Nunito Regular", size: 36)).multilineTextAlignment(.center)
                //Rectangle 16
                Rectangle()
                    .strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1)
                .frame(width: 183, height: 183)
                
                //left, right buttons
                HStack{
                    NavigationLink(
                        destination: BeginnerLeft(),
                        label: {
                            Image("left").position(x:130,y:130)
                        })
                    NavigationLink(
                        destination: BeginnerRight(),
                        label: {
                            Image("right").position(x:50,y:130)
                        })
                }
                
                //Return button
                NavigationLink(
                    destination: GameSystem(),
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
    
    struct Beginner_Previews: PreviewProvider {
        static var previews: some View {
            Beginner()
        }
    }
}
