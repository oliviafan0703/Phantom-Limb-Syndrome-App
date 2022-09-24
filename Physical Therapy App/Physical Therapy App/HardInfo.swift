//
//  HardInfo.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/20/21.
//

import SwiftUI

struct HardInfo: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Info Section").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
                Spacer()
                
                //Graded Motor Imaging
                Text("Graded Motor Imaging\n").font(.custom("Nunito Regular", size: 30)).multilineTextAlignment(.trailing)
                
                //The brain has "maps" of th...
                Text("The brain has 'maps' of the body and when an amputation happens, those maps no longer match the sensory and motor signals from the body. Graded Motor Imagery training techniques cause the brain to “re-think” the pain response that it has been experiencing since the amputation and adopt the image of the healthy hand in place of the injured limb.\n\n").font(.custom("Nunito Regular", size: 20)).frame(width: 300, height: 400)
                
                //Return button
                NavigationLink(
                    destination: Hard(),
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
    
    struct HardInfo_Previews: PreviewProvider {
        static var previews: some View {
            HardInfo()
        }
    }
}
