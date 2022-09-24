//
//  Cam.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/20/21.
//

import SwiftUI

struct Cam: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("PhantomRehab").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
                Spacer()
                
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
                        destination: Hard(),
                        label: {
                            Image("back")
                        }).offset(x:140)
                    //settings and volume buttons
                    HStack{
                        Image("settings").resizable().frame(width: 32.0, height: 32.0)
                        //music Button
                        Button {
                            MusicPlayer.shared.playPauseMusic()
                        } label:{
                        Image("volume").resizable().frame(width: 32.0, height: 32.0)
                        }                    }.offset(x:140)
                }.navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
}
    struct Cam_Previews: PreviewProvider {
        static var previews: some View {
            Cam()
        }
    }
}
