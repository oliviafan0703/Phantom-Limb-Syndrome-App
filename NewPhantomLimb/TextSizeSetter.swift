//
//  TextSizeSetter.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 9/9/21.
//

import SwiftUI

struct TextSizeSetter: View {
        
    @State var isPlaying : Bool = false
    
    let userDefaults = UserDefaults()
    @State var clr = "lightBlue"
    @State var text_size = 27.0
    
    @State var sliderValue = 27.0
    var minimumValue = 20.0
    var maximumvalue = 35.0
    
    var body: some View {
        
            
            VStack{
                
                GeometryReader { geometry in
                    let deepBlue = Color(red:73/255, green:151/255, blue:208/255)
                    VStack{
                        
                        //PhantomRehab bar
                        ZStack{
                                Text("PhantomRehab")
                                    .font(.custom("Raleway SemiBold", size: CGFloat(sliderValue))).multilineTextAlignment(.center).offset(y:20)
                                
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
                        
                        VStack {
                            HStack {
                                Text("\(Int(minimumValue))")
                                // 2.
                                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                                Text("\(Int(maximumvalue))")
                            }.padding()
                            // 3.
                            Text("\(Int(sliderValue))")
                        }
                        
                        Button(action: {
                            userDefaults.setValue(sliderValue, forKey: "saveTextSize")
                            if let value = userDefaults.value(forKey: "saveTextSize") as? Double{
                                text_size = value
                            }
                            //clr = "greenColor";
                        }, label: {
                            Text("Save Text Size")
                        })
                        
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
    
    struct TextSizeSetter_Previews: PreviewProvider {
        static var previews: some View {
            TextSizeSetter()
        }
    }
}


/*
struct TextSizeSetter : View {
    // 1.0
    @State var sliderValue = 0.0
    var minimumValue = 0.0
    var maximumvalue = 30.0
    
    var body: some View {
        VStack {
            HStack {
                Text("\(Int(minimumValue))")
                // 2.
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                Text("\(Int(maximumvalue))")
            }.padding()
            // 3.
            Text("\(Int(sliderValue))")
        }
    }
}*/
