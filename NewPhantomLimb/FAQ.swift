//
//  FAQ.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/15/21.
//

import SwiftUI

struct FAQ: View {
    @State var isPlaying : Bool = false
    @State private var selectedCells: Set<TodoData> = []
    
    @State var clr: String = "lightBlue"
    //change background color
    let userDefaults = UserDefaults()
    
    var todos = MockData.todoList()
    
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
                                }.offset(x:150, y:10)
                            }.frame(width: geometry.size.width, height:geometry.size.height/10).background(Rectangle().fill(deepBlue))
                    
                    Spacer()
                    
                    ScrollView{
                        ForEach(todos){
                            todo in
                            ContentCell(todo: todo, isExpanded: self.selectedCells.contains(todo))
                                .modifier(ScrollCell())
                                .onTapGesture {
                                    if self.selectedCells.contains(todo){
                                        self.selectedCells.remove(todo)
                                    }
                                    else{
                                        self.selectedCells.insert(todo)
                                    }
                                }
                                .animation(.easeInOut(duration: 0.3))
                                .padding(.vertical, 2)
                        }
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
                    
                }//Vstack
            }//geometry reader
        }//Vstack
            .padding(.top, 40)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear(){
                    if let value = userDefaults.value(forKey: "saveColor") as? String{
                        clr = value
                    }
                }
            .background(Color(clr)).ignoresSafeArea()
    }
}

struct TodoData: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let details: String
}

struct ContentCell: View{
    let todo: TodoData
    let isExpanded: Bool
    
    var body: some View{
        HStack{
            
            
            VStack(alignment: .leading){
                HStack{
                    Text(todo.title)
                        .font(.headline)
                        .padding(.leading, 16)
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up":"chevron.down")
                        .font(.system(size: 22, weight:.regular))
                        .padding(.trailing, 16)
                }
                
                if isExpanded {
                    VStack (alignment: .leading){
                        Text(todo.details)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding(.top, 16)
                            .padding(.horizontal, 16)
                    }
                }
            }
            Spacer()
        }.contentShape(Rectangle())
    }
}

struct ScrollCell: ViewModifier{
    func body (content: Content) -> some View{
        Group {
            content
            Divider()
        }
    }
}

struct MockData{
    static func todoList() -> [TodoData]{
        return [
            TodoData(title: "What is the purpose and the benefit of using the PhantomRehab app?", details: "This app provides users with easy-to-follow instructions on how to use a technique called Graded Motor Imagery. Graded Motor Imagery is a 3-step process that uses evidence-based research to prime the central nervous system for maximal neuroplasticity, allowing the user to effectively rewire their brain to reduce their unwanted symptoms.\n\nThe first step in the process is Laterality. This requires the user to identify between a L and a R body part while being timed for efficiency and accuracy.\n\nOnce this level is mastered, the user can proceed to the next step: Imagined Movements. In this stage, the user is prompted to imagine themselves moving the affected body part in a pain-free way. The movements will start out simple and get progressively more complex as the user is ready to progress. If the user has mastered laterality but finds imagined movements to be painful or symptomatic, there are videos of others doing these movements that can be watched until the user is able to imagine themselves moving without issue.\n\nOnce the Imagined Movements level has been mastered, the user progresses to the final stage of GMI: Mirror Therapy. In this level, the user employs the camera on their phone to act as a mirror, reflecting the unaffected limb in a way that makes the user feel that it is really the affected limb. This stage utilizes cells in the brain known as mirror neurons which allow us to essentially trick our brain into thinking the projected image is really our own. Voluntary movements and various sensations are introduced to the non-affected body part, making it appear that these things are happening to both limbs. Once this final level is mastered, the user should be able to move their body in any way they want without experiencing any of their previous symptoms.\n\nRemember, these techniques should be completed with guidance and supervision of a healthcare professional."),
            TodoData(title: "What functionalities does the app entail?", details: "The app can be downloaded by users to aid in proper completion of their sensorimotor exercises as prescribed by their healthcare provider. It follows the principles of Graded Motor Imagery which is an evidence-based technique to create neuroplastic changes in the brain to address chronic centralized  pain, phantom limb syndrome, and Chronic Regional Pain Syndrome.\n\nIt will provide a timer; interactive Q&A for quizzing the user; short clips of body movements for watching; guided prompts for imagining scenarios; body-positive affirmations; body scans; and meditations. This app tracks progress, sends notifications, and is gamified for increased compliance"),
            TodoData(title: "How often should the user complete the exercises?", details: "This answer depends on what level the user is on and how severe their symptoms are.\n\n - For Laterality, the app should be used at least 5 times a day for at least 5 minutes at a time.\n\n - For Motor Imagery, the app should be used for 2 hours a day for at least 2 weeks. \n\n - Finally, the Mirror Therapy should be completed every day for at least 20 minutes until the user is symptom-free.\n\nThis app also contains a reminder feature that can be activated and follows the above guidelines for the user’s convenience."),
            TodoData(title: "In what sequence should the user complete the exercises?", details: "The user should proceed in order from Laterality Training to Imagined Movements to Mirror Therapy."),
            TodoData(title: "Where can I get more information?", details: "Here are some links that will take you to websites with articles, blogs, similar phone apps, and other information on chronic pain, neuroplasticity, and the efficacy of GMI. \n\n - http://www.gradedmotorimagery.com/\n\n - https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3141540/\n\n - https://www.mayoclinic.org/diseases-conditions/phantom-pain/symptoms-causes/syc-20376272\n\n - https://www.ninds.nih.gov/Disorders/Patient-Caregiver-Education/Fact-Sheets/Complex-Regional-Pain-Syndrome-Fact-Sheet\n\n - https://www.theacpa.org/\n\n - https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1820749/\n\n - Orientate App: https://apps.apple.com/us/app/orientate-pain-management/id479540062;\n https://play.google.com/store/apps/details?id=com.reflexpainmanagement.orientatefree&hl=en_GB&gl=US\n\n - Recognise App: https://www.noigroup.com/product/recogniseapp/")
        ]
    }
}

struct FAQ_Previews: PreviewProvider {
    static var previews: some View {
        FAQ()
    }
}
