//
//  GMIinfo.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/3/21.
//

import SwiftUI

struct GMIinfo: View {
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
                        //Beginner
                        Text("Mirror Therapy").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center)
                    }.offset(y:-11)
                    
                    //info section
                    //This targets neurologic co...
                    Text("Mirror Therapy is the final step in GMI training. In this level, the user employs the camera on their phone to act as a mirror, reflecting the unaffected limb in a way that makes the user feel that it’s really the affected limb. Voluntary movements and various sensations are introduced to the non-affected body part, making it appear that these things are happening to both limbs. This stage utilizes cells in the brain known as mirror neurons which allow us to essentially trick our brain into thinking the projected image is really our own.").font(.custom("Nunito Regular", size: 18)).frame(width: 300, height: 400)
                    
                    //Return button
                    NavigationLink(
                        destination: GMI(),
                        label: {
                            Image("Goback")
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
    struct GMIinfo_Previews: PreviewProvider {
        static var previews: some View {
            GMIinfo()
        }
    }
}
