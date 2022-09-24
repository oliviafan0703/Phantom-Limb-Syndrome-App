//
//  GMI.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/3/21.
//

import SwiftUI

struct GMI: View {
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
                            Text("Graded Motor Imaging").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center)
                            
                            //info button
                            NavigationLink(
                                destination: GMIinfo(),
                                label: {
                                    Image("info-circle").resizable().frame(width: 35.0, height: 35.0)
                                })
                        }
                    }.offset(y:-11)
                                        
                    Text("Please set up your device \nas instructed:").font(.custom("Nunito Regular", size: 18)).multilineTextAlignment(.center).frame(width:300, height: 58)
                    //Instruction "Lorem ipsum d...
                    Text("1. Place your device vertically against a wall or other stable surface. \n2. As the camera turns on when you hit 'Begin', make sure you can see the non-affected body part entirely, and that the affected body part is fully covered and out of view. \n3. Complete at least 20 minutes of mirror imagery a day, every day, until you no longer have any symptoms. \n4. Start with simple and basic movements before progressing towards more complex and functional ones, as symptoms allow.").font(.custom("Nunito Regular", size: 18.0)).frame(width:300, height: 400)
                
                //Begin button
                NavigationLink(
                    destination: Cam(),
                    label: {
                        Image("Begin")
                    })

                    Spacer()
                    //tab bar
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
    
    struct GMI_Previews: PreviewProvider {
        static var previews: some View {
            GMI()
        }
    }
}
