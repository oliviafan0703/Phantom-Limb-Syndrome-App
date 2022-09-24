//
//  ColorPicker.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/10/21.
//

import SwiftUI

struct ColorPicker: View {
        
    @State var isPlaying : Bool = false
    
    let userDefaults = UserDefaults()
    @State var clr = "lightBlue"
    
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
                            }.offset(x:150, y:15)
                        }.frame(width: geometry.size.width, height:geometry.size.height/8).background(Rectangle().fill(deepBlue))
                        
                        Spacer()
                        
                        HStack{
                            
                            Button(action: {
                                userDefaults.setValue("lightBlue", forKey: "saveColor")
                                if let value = userDefaults.value(forKey: "saveColor") as? String{
                                    clr = value
                                }
                                //clr = "lightBlue";
                            }, label: {
                                Image ("lightblue")
                            })
                            
                            Button(action: {
                                userDefaults.setValue("darkBlue", forKey: "saveColor")
                                if let value = userDefaults.value(forKey: "saveColor") as? String{
                                    clr = value
                                }
                                //clr = "darkBlue";
                            }, label: {
                                Image ("darkblue")
                            })
                            
                        }
                        
                        HStack{
                            Button(action: {
                                userDefaults.setValue("greenColor", forKey: "saveColor")
                                if let value = userDefaults.value(forKey: "saveColor") as? String{
                                    clr = value
                                }
                                //clr = "greenColor";
                            }, label: {
                                Image ("green")
                            })
                            
                            Button(action: {
                                userDefaults.setValue("purpleColor", forKey: "saveColor")
                                if let value = userDefaults.value(forKey: "saveColor") as? String{
                                    clr = value
                                }
                                //clr = "purpleColor";
                            }, label: {
                                Image ("purple")
                            })
                        }
                        //places tab bar at bottom
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
            .background(Color(clr)).ignoresSafeArea()
        }
    }
    
    class UserSettings: ObservableObject {
        @Published var color: String = "lightBlue"
    }
    
    struct ColorPicker_Previews: PreviewProvider {
        static var previews: some View {
            ColorPicker()
        }
    }
}

