//
//  ContentView.swift
//  StopWatchDemoEN
//
//  Created by Farukh IQBAL on 13/06/2020.
//  Copyright © 2020 Farukh Academy. All rights reserved.
//

import SwiftUI
import Firebase

struct WatchView: View {
    
    let grey = Color(red:196/255, green:196/255, blue:196/255)
    @State private var email: String = ""
    @State private var mirror_days = 0
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    func increment_days(){
        if (stopWatchManager.ifCompleted==true){
            mirror_days = mirror_days+1
        }
    }
    
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
                    mirror_days = document.data().map{$0["mirror_days"]!} as! Int
                    
                    print (mirror_days)
                            
                    increment_days()
                    
                    //update the number of days completed
                    docRef.updateData([
                        "mirror_days": mirror_days
                    ]) { err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            print("Document successfully updated")
                        }
                    }
                    
                    print(mirror_days)
                    
                } else {
                    print("Document does not exist")
                }
            }
        
        }
    
        var body: some View {
            VStack {
                //Youtube video embedded
                //video #1
                VideoView(viewID: "hSIYGZhRGd4")
                
                //video #2
                VideoView(viewID: "Ugwp8wSkVeQ")
                
                //video #3
                VideoView(viewID: "NSG3k13HYjw")
     
                //video #4
                VideoView(viewID: "B4lyPhPAffw")
                
                //video #5
                VideoView(viewID: "ZdZ9vOTsClU")
                
                //video #6
                VideoView(viewID: "WRtRIx70S3k")
                
                //VideoView(viewID: "mMMerxh_12U").frame(width: 400, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                //ORIGINAL TIMER VIEW
//                Text(String(format: "%.1f", stopWatchManager.secondsElapsed))
//                    .font(.custom("Avenir", size: 60))
//
                Text(stopWatchManager.convertSecondsToTime(timeInSeconds: Int(stopWatchManager.secondsElapsed))).font(.custom("Avenir", size: 60))
                
                if stopWatchManager.mode == .stopped {
                    Button(action: {self.stopWatchManager.start()}) {
                        TimerButton(label: "Start", buttonColor: .blue, textColor: .black)
                    }
                }
                if stopWatchManager.mode == .running {
                    Button(action: {self.stopWatchManager.pause()}) {
                        TimerButton(label: "Pause", buttonColor: grey, textColor: .black)
                    }
                }
                if stopWatchManager.mode == .paused {
                    Button(action: {self.stopWatchManager.start()}) {
                        TimerButton(label: "Start", buttonColor: .blue, textColor: .black)
                    }
                    Button(action: {self.stopWatchManager.stop()}) {
                        TimerButton(label: "Reset", buttonColor: Color("lightBlue"), textColor: .black)
                    }
                    .padding(.top, 30)
                }
            }.onAppear(){
                get_info()
            }
        }
    }

struct WatchView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerButton: View {
    
    let label: String
    let buttonColor: Color
    let textColor: Color
    
    var body: some View {
        Text(label)
            .foregroundColor(textColor)
            .padding(.vertical, 20)
            .padding(.horizontal, 90)
            .background(buttonColor)
            .cornerRadius(10)
    }
}

