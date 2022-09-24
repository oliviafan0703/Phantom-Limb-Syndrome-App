//
//  ContentView.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/3/21.
//

import SwiftUI
import Firebase

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    @State private var showAlert = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn (email: String, password: String){
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print("wrong password")
                
                return
            }
            //Successfully signed in
            DispatchQueue.main.async{
                self?.signedIn = true
            }
        }
    }
    
    func signUp (email: String, password: String, phone: String){
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            //Successfully signed in
            let db = Firestore.firestore()
            
            //db.collection("users").addDocument(data: ["email":email, "password":password])
            db.collection("users").document(email).setData(["email": email, "password": password, "phone_number": phone]){ err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
                                                      //, "phone_number":phone])
            
            DispatchQueue.main.async{
                //store email and password
                self?.signedIn = true
            }
        }
    }
    
    func signOut () {
        try? auth.signOut()
        self.signedIn = false
    }
}

struct ContentView: View {
    @EnvironmentObject private var viewModel: AppViewModel
    
    var body: some View {
        NavigationView{
            if viewModel.signedIn {
                Home()
            }
            else{
                SignInView()
            }
        }.onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject private var viewModel: AppViewModel
    @State private var showingAlert = false
    
    var body: some View {
        
        VStack{
            
            GeometryReader { geometry in
                let deepBlue = Color(red:73/255, green:151/255, blue:208/255)
                VStack{
                    
                    //PhantomRehab bar
                    ZStack{
                        HStack{
                            Text("PhantomRehab")
                                .font(.custom("Raleway SemiBold", size: 27)).offset(x:20)
                            
                            //music
                            Button {
                                MusicPlayer.shared.startBackgroundMusic()
                            } label:{
                                Image("volume").offset(x:25)
                            }
                        }
                    }.frame(width: geometry.size.width, height:geometry.size.height/8).background(Rectangle().fill(deepBlue))
                    
                    
                    HStack{
                        Image("patientImage")
                        
                        //Link to provider login
                        NavigationLink(
                            destination: ProviderSignIn(),
                            label: {
                                Image("ProviderPage")
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)                                })
                        
                    }
                    Image("patientText").offset(x:-70)
                    Spacer()
                    //username
                    ZStack{
                        Image("EnterUsername")
                        TextField("Enter email", text: self.$email)
                            .disableAutocorrection(true)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .font(.custom("Raleway SemiBold", size: 15))
                            .offset(x:120)
                    }
                    
                    ZStack{
                        Image("EnterPassword")
                        SecureField("Enter password", text: self.$password)
                            .disableAutocorrection(true)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .font(.custom("Raleway SemiBold", size: 15))
                            .offset(x:120)
                    }
                    
                    //Login button
                    
                    Button(action: {
                        //guard !email.isEmpty, !password.isEmpty else{
                            //return
                        viewModel.signIn(email: email, password: password)
                        //delay alert action
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                            if(viewModel.isSignedIn){
                                showingAlert = false
                            }
                            else{
                                showingAlert = true
                            }
                        }
                        print(viewModel.isSignedIn)
                    }, label: {
                        Image("Login")
                    }).alert(isPresented: $showingAlert){
                        Alert(title: Text("Wrong password"),
                              dismissButton: .default(Text("Try again")))
                    }
                    
                    /*
                     NavigationLink(
                     destination: Home(),
                     label: {
                     Image("Login")
                     })
                     */
                    //Don’t have an account?
                    Text("Don’t have an account?").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center)
                    
                    //Sign up
                    NavigationLink(
                        destination: SignupView(),
                        label: {
                            Text("Sign up").font(.custom("Nunito Regular", size: 24)).underline().foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.22, blue: 0.96, alpha: 1))).multilineTextAlignment(.center)                               })
                    //places tab bar at bottom
                    Spacer()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            //background color
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("lightBlue")).ignoresSafeArea()
            //showing alert if password is wrong
            }
        
    }
}

struct SignupView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phone: String = ""
    @EnvironmentObject private var viewModel: AppViewModel
    @State private var showingAlert = false
    
    var body: some View {
        
        VStack{
            
            GeometryReader { geometry in
                let deepBlue = Color(red:73/255, green:151/255, blue:208/255)
                VStack{
                    
                    //PhantomRehab bar
                    ZStack{
                        HStack{
                            Text("PhantomRehab")
                                .font(.custom("Raleway SemiBold", size: 27)).offset(x:20)
                            
                            //music
                            Button {
                                MusicPlayer.shared.startBackgroundMusic()
                            } label:{
                                Image("volume").offset(x:25)
                            }
                        }
                    }.frame(width: geometry.size.width, height:geometry.size.height/8).background(Rectangle().fill(deepBlue))
                    
                    Spacer()
                    
                    Image("Create Account")
                    
                    Spacer()
                    //username
                    ZStack{
                        Image("EnterUsername")
                        TextField("Enter email", text: self.$email)
                            .disableAutocorrection(true)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .font(.custom("Raleway SemiBold", size: 15))
                            .offset(x:120)
                    }
                    
                    
                    ZStack{
                        Image("EnterPassword")
                        SecureField("Enter password", text: self.$password)
                            .disableAutocorrection(true)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .font(.custom("Raleway SemiBold", size: 15))
                            .offset(x:120)
                    }
                    
                    ZStack{
                        Image("EnterPhone")
                        TextField("Enter phone number", text: self.$phone)
                            .disableAutocorrection(true)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .font(.custom("Raleway SemiBold", size: 15))
                            .offset(x:120)
                    }
                    
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else{
                            return
                        }
                        viewModel.signUp(email: email, password: password, phone: phone)
                    }, label: {
                        Image("signup")
                    }).alert(isPresented: $showingAlert){
                        Alert(title: Text("Wrong password"),
                              dismissButton: .default(Text("Try again")))
                    }
                    
                    //Already have an account
                    Text("Already have an account?").font(.custom("Nunito Regular", size: 24)).multilineTextAlignment(.center)
                    
                    //Sign in
                    NavigationLink(
                        destination: SignInView(),
                        label: {
                            Text("Sign in").font(.custom("Nunito Regular", size: 24)).underline().foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.22, blue: 0.96, alpha: 1))).multilineTextAlignment(.center)                               })
                    /*
                     NavigationLink(
                     destination: Home(),
                     label: {
                     Image("Login")
                     })
                     */
                    
                    //places tab bar at bottom
                    //Spacer()
                    //tab bar
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            //background color
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("lightBlue")).ignoresSafeArea()
            //showing alert if password is wrong
            }
        
    }
}

struct Profile: View {
    
    @State var isPlaying : Bool = false
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phone: String = ""
    @EnvironmentObject var viewModel: AppViewModel
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
                                MusicPlayer.shared.playPauseMusic()
                                self.isPlaying.toggle()
                            }){
                                Image(self.isPlaying == true ? "volume" : "mute")
                            }
                        }.offset(x:150, y:20)
                    }.frame(width: geometry.size.width, height:geometry.size.height/8).background(Rectangle().fill(deepBlue))
                    
                    Spacer()
                    //My Profile
                    Text("My Profile").font(.custom("Raleway SemiBold", size: 27)).multilineTextAlignment(.center)
                    
                    VStack{
                    //Email
                    HStack{
                        Image("envelope 1").resizable().frame(width: 32.0, height: 32.0).offset(x:20)
                        Text("\(email)").font(.custom("Raleway Regular", size: 20)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6))).multilineTextAlignment(.center).offset(x:20)
                    }.offset(y:30)
                    //Phone number
                    HStack{
                        Image("phone_icon").resizable()
                            .frame(width: 32.0, height: 32.0).offset(x:-20)
                        Text("\(phone)").font(.custom("Raleway Regular", size: 20)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6))).multilineTextAlignment(.center)
                    }.offset(y:30)
                    //Password
                    HStack{
                        Image("lock").resizable().frame(width: 32.0, height: 32.0).offset(x:-20)
                        Text("\(password)").font(.custom("Raleway Regular", size: 20)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6))).multilineTextAlignment(.center)
                    }.offset(y:30)
                        
                    
                    }.onAppear(){
                        get_profile()
                        //retrieve_data()
                    }
                                    
                    Spacer()
                    
                    //Sign out button
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Image("SignOut")
                    })
                    
                    /*
                     NavigationLink(
                     destination: ContentView(),
                     label: {
                     Image("SignOut")
                     })
                     */
                    
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
                }
            }
            .navigationBarTitle("")
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
    
    func get_profile(){
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
                phone = document.data().map{$0["phone_number"]!} as! String
                
            } else {
                print("Document does not exist")
            }
        }
        
    }
    
    func retrieve_data(){
        let currentUser = Auth.auth().currentUser
        let db = Firestore.firestore()
        
        //get user uid, email
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            let email = user.email
        }
        //let uid = user.uid
        //String uid = auth.currentUser.uid.toString();
        
        if let userId = Auth.auth().currentUser?.uid {
            //"SwWl1ykUOfR8KgIPsxK2"
            
            let docRef = db.collection("users").document(phone)
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                    print("Document data: \(dataDescription)")
                    
                    email = document.data().map{$0["email"]!} as! String
                    password = document.data().map{$0["password"]!} as! String
                    phone = document.data().map{$0["phone_number"]!} as! String
                    
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
    
struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()//.environmentObject(AppViewModel())
    }
}
}
