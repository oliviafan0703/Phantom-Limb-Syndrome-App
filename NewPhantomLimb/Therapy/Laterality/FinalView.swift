//
//  FinalView.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/10/21.
//

import SwiftUI
import Firebase
import AVFoundation

struct FinalView : View {
   var score : Int
    var time : Double
    var percentage : Double
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var days = 0
    @EnvironmentObject private var viewModel: AppViewModel
    @State private var showingAlert = false
    @State private var success = false

    func increment_days(){
        if (time < 2.0 && percentage>0.9){
            days = days+1
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
                    password = document.data().map{$0["password"]!} as! String
                    days = document.data().map{$0["days"]!} as! Int
                    
                    print (days)
                    
                    increment_days()
                    
                    //update the number of days completed
                    docRef.updateData([
                        "days": days
                    ]) { err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            print("Document successfully updated")
                        }
                    }
                    
                    print(days)
                    
                } else {
                    print("Document does not exist")
                }
            }
        
        }

    
    func retrieve_data(){
        let currentUser = Auth.auth().currentUser
        let db = Firestore.firestore()
        //String uid = auth.currentUser.uid.toString();
        
        if let userId = Auth.auth().currentUser?.uid {
            
        let docRef = db.collection("users").document(userId)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                
                email = document.data().map{$0["email"]!} as! String
                password = document.data().map{$0["password"]!} as! String
                days = document.data().map{$0["day"]!} as! Int

                //"SwWl1ykUOfR8KgIPsxK2"
                
            } else {
                print("Document does not exist")
                print(userId)
            }
            }
        }
        
        /*
        db.collection("users")
            //.document("")
            .addSnapshotListener {(querySnapshot, err) in
            guard let documents = querySnapshot?.documents else{
                print("Error fetching documents")
                return
            }
                let email = documents.map{$0["email"]!}
            let password = documents.map{$0["password"]!}
            print(password)
            }
        */
        

    }

    /*
    func getDestination() -> AnyView {
        if(percentage>0.9){
            LateralityPass()
        }
        else{
            LateralityFail()
        }
    }
     */
    
   var body: some View {
       VStack{
        
        //Congratulations! You’ve finished.
            Text("Congratulations! You’ve finished.").font(.custom("Raleway SemiBold", size: 20)).multilineTextAlignment(.center)
        
        let pct = NSNumber(value: percentage)
           
        
        Text("Final Score : \(score)")
            .font(.custom("Raleway Regular", size: 20))
            .onAppear(){
                SaveScore(quiz: "myQuiz1", score: self.score)
                SoundEffectPlayer.shared.startBackgroundMusic()
                get_info()
            }
           
        Text("Progress: \(days) days")
               .font(.custom("Raleway Regular", size: 20))
               .onAppear(){
                   get_info()
                   increment_days()
            }
        
        Text("\nAccuracy: \(pct.getPercentage())").font(.custom("Raleway Regular", size: 20))
           
           Text("Average response time: \(String(format: "%.3f", time)) s\n\n").font(.custom("Raleway Regular", size: 20))
        
        //Progress circle
        ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(percentage))
                .stroke(Color.green, style: StrokeStyle(lineWidth: 10.0, lineCap: .round))
                .frame(width:100)
                .rotationEffect(Angle(degrees:-90))
            Text("\(pct.getPercentage())")
        }
        Text("Percentage Accuracy")
        
        Spacer()
        
        NavigationLink(destination:
            getDestination(),
            //LateralityPass(),
        label: {
            Image("continue")
        })
           
       }
   }
    
    func getDestination() -> AnyView
    {
        if (percentage>0.9){
            return AnyView(LateralityPass())
        } else {
            return AnyView(LateralityFail())
        }
    }
}

struct FinalView_Previews: PreviewProvider {
   static var previews: some View {
    FinalView(score: 1, time: 0.0, percentage: 0.0)
   }
}

extension NSNumber {
    func getPercentage() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0 // You can set what you want
        return formatter.string(from: self)!
    }
}

struct LateralityPass: View {
     @State private var email: String = ""
     @State private var password: String = ""
     @State private var days = 0
     @EnvironmentObject private var viewModel: AppViewModel
     @State private var showingAlert = false
    
    var body: some View {
        VStack{
        Text("You’ve passed!\n").font(.custom("Raleway SemiBold", size: 24)).foregroundColor(Color(#colorLiteral(red: 0.46, green: 0.69, blue: 0.38, alpha: 1))) + Text("\(7-days) days to go").font(.custom("Raleway SemiBold", size: 24)).foregroundColor(Color.blue)
            NavigationLink(destination:
                Home(),
            label: {
                Image("Goback")
            })
        
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("lightBlue")).ignoresSafeArea()
        .onAppear(){
            get_progress_info()
        }
    }
    
    func get_progress_info(){
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
                    password = document.data().map{$0["password"]!} as! String
                    days = document.data().map{$0["days"]!} as! Int
                                        
                } else {
                    print("Document does not exist")
                }
            }
        
        }

}

struct LateralityFail: View {
    var body: some View {
        VStack{
            Text("Good job! \nKeep working to reach the goal.").font(.custom("Raleway SemiBold", size: 24)).foregroundColor(Color.blue)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("lightBlue")).ignoresSafeArea().multilineTextAlignment(.center)
    }
}

