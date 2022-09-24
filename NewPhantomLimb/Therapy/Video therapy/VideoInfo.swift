//
//  LateralityInfo.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/3/21.
//

import SwiftUI

struct VideoInfo: View {
    
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
                            Text("Imagined Movements").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center)
                    }.offset(y:-11)
                                        
                    //info section
                    //This targets neurologic co...
                    Text("Imagined Movements is the second step in GMI training. This step requires you to imagine moving the affected area in a normal and pain-free way. You may start with basic movements that take you through a normal range of motion and then progress to more complex and functional movements as your symptoms allow. If imagining yourself performing these movements is too painful, imagine others doing them. Videos of common and everyday movements are provided as a starting point, but are only some examples. Look up other videos or watch others in real life to continue this therapy outside of the app.").font(.custom("Nunito Regular", size: 18))
                    .frame(width: 300, height: 400)
                    
                    //Return button
                    NavigationLink(
                        destination: Video(),
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
    struct VideoInfo_Previews: PreviewProvider {
        static var previews: some View {
            VideoInfo()
        }
    }
}
