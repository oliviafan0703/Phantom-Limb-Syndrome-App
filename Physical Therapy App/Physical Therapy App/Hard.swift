//
//  Hard.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/20/21.
//

import SwiftUI

struct Hard: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("PhantomRehab").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
                Spacer()
                
                //Advanced bar
                ZStack{
                    //level-bar
                    Rectangle()
                        .fill(Color(red:196/255,green:196/255,blue:196/255))
                        .frame(width: 375, height: 60)
                    HStack{
                        //Beginner
                        Text("Advanced").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center)
                        
                        //info button
                        NavigationLink(
                            destination: HardInfo(),
                            label: {
                                Image("info-circle").resizable().frame(width: 35.0, height: 35.0)
                            })
                    }
                    Text("Please set up your device as instructed:").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center).offset(y:80)
                    //Instruction "Lorem ipsum d...
                    Text("1.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n2. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n3. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ").font(.custom("Nunito Regular", size: 20)).frame(width:300, height: 390).offset(y:260)
                }.offset(y:-240)
                
                //Begin button
                NavigationLink(
                    destination: Cam(),
                    label: {
                        Image("Begin")
                    })
                
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
    
    struct Hard_Previews: PreviewProvider {
        static var previews: some View {
            Hard()
        }
    }
}
