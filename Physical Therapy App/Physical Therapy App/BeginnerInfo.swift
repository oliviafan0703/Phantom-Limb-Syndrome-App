//
//  BeginnerInfo.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/20/21.
//

import SwiftUI

struct BeginnerInfo: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Info Section").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
                Spacer()
                
                //Laterality
                Text("Laterality Construction").font(.custom("Nunito Regular", size: 30)).multilineTextAlignment(.trailing)
                
                //info section
                //This targets neurologic co...
                Text("This targets neurologic connections between the brain and the affected body part by having you identify images of that body part as either left or right. By practicing this technique, your brain sharpens its ability to identify this area and to start normalizing messages between the brain and body to create a more accurate map.\n\nKeep in mind that laterality training is not a 'test' – they can actually be fun! Try your best to not become frustrated if you are not a pro at this exercise at first. Recovery takes time and is not linear. Go easy on yourself and know that you are working toward progress. :)\n").font(.custom("Nunito Regular", size: 20))
                .frame(width: 300, height: 500)
                
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
    
    struct BeginnerInfo_Previews: PreviewProvider {
        static var previews: some View {
            BeginnerInfo()
        }
    }
}
