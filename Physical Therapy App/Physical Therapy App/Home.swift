//
//  Home.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/19/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("PhantomRehab").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
                HStack{
                    NavigationLink(
                        destination: Profile(),
                        label: {
                            Image("MyProfile").position(x:90,y:230)
                        })
                    NavigationLink(
                        destination: progress(),
                        label: {
                            Image("MyProgress").position(x:100,y:230)
                        })
                }
                HStack{
                    NavigationLink(
                        destination: GameSystem(),
                        label: {
                            Image("GMI").position(x:90,y:120)
                        })
                    NavigationLink(
                        destination: meditation(),
                        label: {
                            Image("Meditation").position(x:100,y:120)
                        })
                }
                //Sign out button
                NavigationLink(
                    destination: ContentView(),
                    label: {
                        Image("SignOut")
                    })
                
                HStack{
                    Image("settings").resizable().frame(width: 32.0, height: 32.0)
                    //Music Button
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
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
}
