//
//  Home.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/3/21.
//

import SwiftUI

struct Home: View {
    
    @State var clr: String = "lightBlue"
    
    //change background color
    let userDefaults = UserDefaults()
    
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
                                        MusicPlayer.shared.startBackgroundMusic()
                                    }){
                                        Image("volume")
                                    }
                            }.offset(x:150, y:15)
                        }.frame(width: geometry.size.width, height:geometry.size.height/8).background(Rectangle().fill(deepBlue))
                        
                        Spacer()
                        
                        //Four buttons in settings
                        NavigationLink(
                            destination: MusicPicker(),
                            label: {
                                Image("Music")
                            })
                        
                        Spacer()
                        //Meditation button
                        NavigationLink(
                            destination: Meditation(),
                            label: {
                                Image("Meditation")
                            })
                        
                        Spacer()
                        //GMI button
                        NavigationLink(
                            destination:        NotificationListView(),
                            label: {
                                Image("Reminder")
                            })
                        
                        //places tab bar at bottom
                        Spacer()
 
                        NavigationLink(
                            destination: FAQ(),
                            label: {
                                Image("FAQs")
                            })
                        
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
                .onAppear(){
                    if let value = userDefaults.value(forKey: "saveColor") as? String{
                        clr = value
                    }
                }
            .background(Color(clr)).ignoresSafeArea()
        }
    }
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
}
