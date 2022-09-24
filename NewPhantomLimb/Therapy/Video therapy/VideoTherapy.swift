//
//  Meditation.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/5/21.
//

import SwiftUI

struct VideoTherapy: View {
    
    @State var isPlaying : Bool = false
    
    var body: some View {
        
        VStack{
            
            GeometryReader { geometry in
                let deepBlue = Color(red:73/255, green:151/255, blue:208/255)
                VStack{
                    
                    //PhantomRehab bar
                    ZStack{
                        Text("PhantomRehab")
                            .font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).offset(y:20)
                        
                        //music
                        ZStack{
                            Button (action: {
                                MusicPlayer.shared.playPauseMusic()
                                self.isPlaying.toggle()
                            }){
                                Image(self.isPlaying == true ? "volume" : "mute")
                            }
                        }.offset(x:150, y:20)
                    }.frame(width: geometry.size.width, height:geometry.size.height/8).background(Rectangle().fill(deepBlue))
                    ZStack{
                        //level-bar
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 375, height: 60)
                        HStack{
                            //Beginner
                            Text("Intermediate").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center)
                        }
                    }.offset(y:-11)
                    
                    Spacer()
                    
                    //video #1
                    VideoView(viewID: "hSIYGZhRGd4")
                    
                    //video #2
                    VideoView(viewID: "Ugwp8wSkVeQ")
                    
                    //video #3
                    VideoView(viewID: "NSG3k13HYjw")
                    
                    //video #4
                    VideoView(viewID: "B4lyPhPAffw")
                    
                    //video #5
                    VideoView(viewID: "ZdZ9vOTsClU")
                    
                    //video #6
                    VideoView(viewID: "WRtRIx70S3k")
                    
                    ///tab bar
                    ZStack{
                        Image("2tab-bar")
                        HStack{
                                NavigationLink(
                                    destination: Home(),
                                    label: {
                                        Image("2home")
                                    })
                                Spacer()
                                NavigationLink(
                                    destination: Progress(),
                                    label: {
                                        Image("2progress")
                                    })
                                Spacer()
                                NavigationLink(
                                    destination: Profile(),
                                    label: {
                                        Image("2profile")
                                    })
                                Spacer()
                                NavigationLink(
                                    destination: Settings(),
                                    label: {
                                        Image("2settings")
                                    })
                                Spacer()
                                NavigationLink(
                                    destination: Therapy(),
                                    label: {
                                        Image("2therapy")
                                    })
                        }.frame(width: geometry.size.width-68, height:geometry.size.height/14).offset(x:-6, y:-10)
                    }
                }.navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            //background color
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("lightBlue")).ignoresSafeArea()
        }
    }
    
    struct VideoTherapy_Previews: PreviewProvider {
        static var previews: some View {
            VideoTherapy()
        }
    }
}
