//
//  progress.swift
//  Physical Therapy App
//
//  Created by Olivia Fan on 7/20/21.
//

import SwiftUI

struct progress: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("PhantomRehab").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).background(Rectangle().fill(Color(red:73/255, green:151/255, blue:208/255)).frame(width:375, height: 75))
                Spacer()
                
                //My Progress
                Text("My Progress").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center).position(x:180,y:80)
                
                ZStack{
                    //Ellipse 1
                    Circle()
                        .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
                        .frame(width: 225, height: 225)
                    
                    //This is a progress bar...
                    Text("This is a progress bar...").font(.custom("Raleway Regular", size: 20))
                }.position(x:180,y:0)
                
                //Return button
                NavigationLink(
                    destination: Home(),
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
                    }
                }.offset(x:140)
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    struct progress_Previews: PreviewProvider {
        static var previews: some View {
            progress()
        }
    }
}
