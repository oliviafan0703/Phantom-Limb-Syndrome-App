//
//  Cam.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/3/21.
//

import SwiftUI

struct Cam: View {
    var body: some View {
        VStack{
            
            GeometryReader { geometry in
                let deepBlue = Color(red:73/255, green:151/255, blue:208/255)
                VStack{
                    
                    //PhantomRehab bar
                    ZStack{
                        HStack{
                            Text("PhantomRehab")
                                .font(.custom("Raleway SemiBold", size: 27)).offset(x:20)
                            
                            //music
                            Button {
                                MusicPlayer.shared.playPauseMusic()
                            } label:{
                                Image("volume").offset(x:25)
                            }
                        }
                    }.frame(width: geometry.size.width, height:geometry.size.height/8).background(Rectangle().fill(deepBlue))
                    
                    //Video
                    VStack {
                        //Insert camera
                        CameraViewController()
                            .edgesIgnoringSafeArea(.top)
                        //.frame(width: 375, height: 400)
                        //.offset(y:-150)
                        
                        //CameraViewController().edgesIgnoringSafeArea(.top)//.frame(width: 30, height: 30)
                        
                        //Back button
                        NavigationLink(
                            destination: GMI(),
                            label: {
                                Image("back")
                            }).offset(x:140)
                        
                        Spacer()
                        
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
    }
    struct Cam_Previews: PreviewProvider {
        static var previews: some View {
            Cam()
        }
    }
}
