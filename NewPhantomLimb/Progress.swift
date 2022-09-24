//
//  Progress.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/3/21.
//

import SwiftUI
import Firebase

struct Progress: View {
    
    @State var isPlaying : Bool = false
    @State var clr: String = "lightBlue"
    @State private var days = 0
    @State private var mirror_days = 0
    @State private var email: String = ""
    
    //change background color
    let userDefaults = UserDefaults()
    
    func get_info(){
        let user = Auth.auth().currentUser
        let db = Firestore.firestore()
        //get current user uid and email
        if let user = user{
            let uid = user.uid
            let userEmail = user.email
            email = userEmail!
            print (uid)
            print (email)
        }
        
        //retrieve specific document from the name
        //using email as the root node
        let docRef = db.collection("users").document(email)
        
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                    print("Document data: \(dataDescription)")
                    
                    email = document.data().map{$0["email"]!} as! String
                    days = document.data().map{$0["days"]!} as! Int
                    mirror_days = document.data().map{$0["mirror_days"]!} as! Int
                                        
                } else {
                    print("Document does not exist")
                }
            }
        
        }
    
    var body: some View {
        
        VStack{
            
            GeometryReader { geometry in
                let deepBlue = Color(red:73/255, green:151/255, blue:208/255)
                VStack{
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
                    
                    
                    //Laterality circle
                    let lateralityFinishRate = Double(days)/7
                    let lateralityPct = NSNumber(value: lateralityFinishRate)
                    
                    ZStack {
                        Circle()
                            .trim(from: 0, to: CGFloat(lateralityFinishRate))
                            .stroke(Color.green, style: StrokeStyle(lineWidth: 10.0, lineCap: .round))
                            .frame(width:100)
                            .rotationEffect(Angle(degrees:-90))
                        Text("\(lateralityPct.getPercentage())")
                    }.onAppear(){
                        get_info()
                    }
                    Text("Laterality")
                    
                    
                    //Motor Imagery circle
                    let motorFinishRate = Double(mirror_days)/14
                    let motorPct = NSNumber(value: motorFinishRate)
                    ZStack {
                        Circle()
                            .trim(from: 0, to: CGFloat(motorFinishRate))
                            .stroke(Color.green, style: StrokeStyle(lineWidth: 10.0, lineCap: .round))
                            .frame(width:100)
                            .rotationEffect(Angle(degrees:-90))
                        Text("\(motorPct.getPercentage())")
                    }
                    Text("Motor Imagery")
                    
                    //Progress circle
                    ZStack {
                        Circle()
                            .trim(from: 0, to: 0.0)
                            .stroke(Color.green, style: StrokeStyle(lineWidth: 10.0, lineCap: .round))
                            .frame(width:100)
                            .rotationEffect(Angle(degrees:-90))
                        Text("0%")
                    }
                    Text("GMI")

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
            //change background color
            .onAppear(){
                if let value = userDefaults.value(forKey: "saveColor") as? String{
                    clr = value
                }
            }
            .background(Color(clr)).ignoresSafeArea()
        }
    }
    
    struct Progress_Previews: PreviewProvider {
        static var previews: some View {
            Progress()
        }
    }
}
