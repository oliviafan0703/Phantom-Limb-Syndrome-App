//
//  Intermediate.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/20/21.
//

import SwiftUI

struct Intermediate: View {
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
                        //Beginner
                        Text("Intermediate").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center)
                }.offset(y:-120)

                //Video
                ZStack {
                    Rectangle()
                        .fill(Color(red:196/255,green:196/255,blue:196/255))
                    Text("Video").font(.custom("Nunito Regular", size: 35)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center)
                }
                .frame(width: 375, height: 259)
                .offset(y:-50)
                
                //NextButton
                NavigationLink(
                    destination: IntermediateNext(),
                    label: {
                        Image("next")
                    })
    
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
    
    struct Intermediate_Previews: PreviewProvider {
        static var previews: some View {
            Intermediate()
        }
    }
}
