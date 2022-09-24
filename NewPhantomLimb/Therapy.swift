//
//  Therapy.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/3/21.
//

import SwiftUI
import Firebase

struct Therapy: View {
    
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
                    
                    print (days)
                    
                } else {
                    print("Document does not exist")
                }
            }
        
        }
    
    //select if the second level unlocks
    func getMotorImage() -> Image
    {
        if (days>=7){
            return Image("motor_imagery")
        } else {
            return Image("motor_locked")
        }
    }
    
    func getMotorDestination() -> AnyView
    {
        if (days>=7){
            return AnyView(Video())
        } else {
            return AnyView(Therapy())
        }
    }
    
    //select if the third level unlocks
    func getMirrorImage() -> Image
    {
        if (mirror_days>=14){
            return Image("mirror_therapy")
        } else {
            return Image("mirror_locked")
        }
    }
    
    func getMirrorDestination() -> AnyView
    {
        if (mirror_days>=14){
            return AnyView(GMI())
        } else {
            return AnyView(Therapy())
        }
    }
    
    
    var body: some View{
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
                        
//                        ZStack{
//                            //level-bar
//                            Rectangle()
//                                .fill(Color.white)
//                                .frame(width: 375, height: 60)
//                            HStack{
//                                //Beginner
//                                Text("Graded Motor Imagery").font(.custom("Nunito Regular", size:  24.0)).multilineTextAlignment(.center)
//
//                                //info button
//                                NavigationLink(
//                                    destination: LateralityInfo(),
//                                    label: {
//                                        Image("info-circle").resizable().frame(width: 35.0, height: 35.0)
//                                    })
//                            }
//                        }.offset(y:-11)
                        
                        Spacer()
                        //laterality button
                        
                        NavigationLink(
                            destination: Laterality(),
                            label: {
                                Image("laterality_level")
                            }).onAppear(){
                                get_info()
                            }
                        
                        Spacer()
                                                
                        //Motor Imagery
                        NavigationLink(
                            destination: getMotorDestination(),
                            label: {
                                getMotorImage()
                            })

                    
                        Spacer()
                        //Mirror therapy
                        NavigationLink(
                            destination: getMirrorDestination(),
                            label: {
                                getMirrorImage()
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
                .onAppear(){
                    if let value = userDefaults.value(forKey: "saveColor") as? String{
                        clr = value
                    }
                }
            .background(Color(clr)).ignoresSafeArea()
        }
    }
    
    struct Therapy_Previews: PreviewProvider {
        static var previews: some View {
            Therapy()
        }
    }
    
}
