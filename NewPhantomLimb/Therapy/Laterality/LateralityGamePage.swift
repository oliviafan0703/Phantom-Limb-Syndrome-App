//
//  LateralityGamePage.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/9/21.
//

import SwiftUI

struct LateralityGamePage: View {
    //MusicPlayer
    @State var isPlaying : Bool = false
    
    //number of question
    @State var i : Int = 0
    
    //var for the score
    @State var score = 0
    @State private var showActionSheet = false
    
    //keeping track of time
    @State public var totalSeconds = 0.0
    @State var timer = LateralityTimer()

    @State var imagePrompt = Image("placeholder")
    let imagesInRandomOrder = myQuiz1.shuffled()
    
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
                            Text("Laterality Construction").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center)
                            
                            //info button
                            NavigationLink(
                                destination: LateralityInfo(),
                                label: {
                                    Image("info-circle").resizable().frame(width: 35.0, height: 35.0)
                                })
                        }
                    }.offset(y:-11)

                    Spacer()
                    
                    
                    //if i < of questions --> play question
                    if(self.i < myQuiz1.count){
                        
                        //prompt
                        Text("Please identify the \nfollowing body part").font(.custom("Nunito Regular", size: 25)).multilineTextAlignment(.center)
                                                
                        //image of the question
                        Image(imagesInRandomOrder[self.i].img!)
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal)
                            .onAppear{
                                self.timer.start()
                                print("timer starting")
                            }
                            .onChange(of: self.i) { newValue in
                                self.timer.start()
                                print("timer starting")
                            }
                        
                        /*
                        Image(imagesInRandomOrder[self.i].img!)
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal)
                            .onChange(of: self.i) { newValue in
                                self.timer.start()
                                print("timer starting")
                                print(timer.secondsElapsed)
                            }
                            */
                        
                        HStack{
                            //left button
                                   Button(action:{
                                       self.buttonAction(n: 1)
                                    //self.showActionSheet = true
                                   },label: {
                                    Image("left").position(x:130,y:130)
                                   })
                                   .actionSheet(isPresented: $showActionSheet) {
                                       ActionSheet(
                                           title: Text("Score"),
                                           message: Text("Score : \(self.score) / \(myQuiz1.count)"),
                                           buttons: [
                                               .cancel { print(self.showActionSheet)
                                               }
                                           ]
                                       )
                                   }
                            
                            //right button
                                   Button(action:{
                                       self.buttonAction(n: 2)
                                       //self.showActionSheet = true
                                   },label: {
                                    Image("right").position(x:50,y:130)
                                   })
                                   .actionSheet(isPresented: $showActionSheet) {
                                       ActionSheet(
                                           title: Text("Score"),
                                           message: Text("Score : \(self.score) / \(myQuiz1.count)"),
                                           buttons: [
                                               .cancel { print(self.showActionSheet)
                                               }
                                           ]
                                       )
                                   }
                        }
                    }
                    
                    //after last question --> show final view with score
                    else{
                        FinalView(score : self.score, time: self.avgTime(), percentage: self.percentAccuracy())
                    }
                    
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
    
    //action of the buttons
    //n = answer [0,1]
    func buttonAction( n : Int){
        //if answer is correct increment score
        if(myQuiz1[self.i].correct == n){
            self.score = self.score + 1
        }
        //GO TO NEXT QUESTION
        self.i = self.i + 1
        print(timer.secondsElapsed)
        totalSeconds = totalSeconds + timer.secondsElapsed;
        print("total: \(totalSeconds)")
        self.timer.stop()
        let t = avgTime()
        print("AVGtime: \(t)")
    }
    
    struct LateralityGamePage_Previews: PreviewProvider {
        static var previews: some View {
            LateralityGamePage()
        }
    }
    
    func percentAccuracy() -> Double{
        return Double(score)/Double(myQuiz1.capacity)
    }
    
    func avgTime() -> Double {
        return totalSeconds/Double(myQuiz1.capacity)
    }
}
