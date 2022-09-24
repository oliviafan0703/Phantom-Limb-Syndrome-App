//
//  LateralityWrong.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/3/21.
//

import SwiftUI

struct LateralityWrong: View {
    
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
                            Text("Beginner").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center)
                            
                            //info button
                            NavigationLink(
                                destination: LateralityInfo(),
                                label: {
                                    Image("info-circle").resizable().frame(width: 35.0, height: 35.0)
                                })
                        }
                    }.offset(y:-11)
                    
                    Spacer()
                    
                    //Oops... That’s wrong.
                    Text("Oops... That’s wrong.").font(.custom("Nunito Regular", size: 36)).multilineTextAlignment(.center).offset(y:-100)
                    
                    //Try Again button
                    NavigationLink(
                        destination: Laterality(),
                        label: {
                            Image("tryagain")
                        })
                    //Return button
                    NavigationLink(
                        destination: Laterality(),
                        label: {
                            Image("Goback")
                        })
                    
                    //tab bar
                    ZStack{
                        Image("tab-bar")
                        HStack{
                            NavigationLink(
                                destination: Home(),
                                label: {
                                    Image("Home")
                                })
                            Spacer()
                            NavigationLink(
                                destination: Progress(),
                                label: {
                                    Image("progress")
                                })
                            Spacer()
                            NavigationLink(
                                destination: Profile(),
                                label: {
                                    Image("profile")
                                })
                            Spacer()
                            NavigationLink(
                                destination: Therapy(),
                                label: {
                                    Image("therapy")
                                })
                            Spacer()
                            NavigationLink(
                                destination: Settings(),
                                label: {
                                    Image("setting")
                                })
                        }
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
    
    struct LateralityWrong_Previews: PreviewProvider {
        static var previews: some View {
            LateralityWrong()
        }
    }
}
