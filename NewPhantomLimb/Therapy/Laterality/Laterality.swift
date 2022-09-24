//
//  Laterality.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/3/21.
//

import SwiftUI

struct Laterality: View {
    
    //var for the score
    @State var score = 0
    @State var isPlaying : Bool = false
    @State var buttonText = "Check Progress"
    
    @State var text_size = 24.0
    
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
                            Text("Laterality Reconstruction").font(.custom("Nunito Regular", size:  24.0)).multilineTextAlignment(.center)
                            
                            //info button
                            NavigationLink(
                                destination: LateralityInfo(),
                                label: {
                                    Image("info-circle").resizable().frame(width: 35.0, height: 35.0)
                                })
                        }
                    }.offset(y:-11)
                                        
                    //In this part, you will ......
                    Text("In this part, you will ...\n- Differentiate between left and right in under 2 seconds. \n - Score at least 90% for response time AND accuracy for a week to advance to the next level \n - Click 'Check progress' to review progress from previous therapy").font(.custom("Raleway Medium", size: 18.0)).frame(width:300, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                       
                    
                    NavigationLink(destination: LateralityGamePage()) {
                        Image("Begin")
                    }
                    
                    /*
                    //display your score
                    Text("last score : \(self.score) / \(myQuiz1.count)")
                        .onAppear(){ //refresh score
                            self.score = LoadScore(quiz: "myQuiz1")
                        }
                    */
                    
                    Button(action: {
                    buttonText = "7 days to go!"
                    }, label: {
                    Text("\(buttonText)")
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
                .onAppear(){
                    if let value = userDefaults.value(forKey: "saveTextSize") as? Double{
                        text_size = value
                    }
                }
            .background(Color("lightBlue")).ignoresSafeArea()
        }
    }
    
    struct Laterality_Previews: PreviewProvider {
        static var previews: some View {
            Laterality()
        }
    }
}
