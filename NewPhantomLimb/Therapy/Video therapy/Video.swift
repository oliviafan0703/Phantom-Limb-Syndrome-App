//
//  Video.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/3/21.
//

import SwiftUI

struct Video: View {
    
    @State var isPlaying : Bool = false
    @State private var selectedCells: Set<TodoData> = []

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
                            //Intermediate
                            Text("Imagined Movements").font(.custom("Nunito Regular", size: 24))
                            //info button
                            NavigationLink(
                                destination: VideoInfo(),
                                label: {
                                    Image("info-circle").resizable().frame(width: 35.0, height: 35.0)
                                })
                        }.multilineTextAlignment(.center)
                    }.offset(y:-11)
                    
                    Spacer()
                    
                    //Youtube video embedded
                    //VideoView(viewID: "mMMerxh_12U")
                    
                    //video submenu
                    
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
                    
                    //Video
                    /*
                    ZStack {
                        Rectangle()
                            .fill(Color(red:196/255,green:196/255,blue:196/255))
                        Text("Video").font(.custom("Nunito Regular", size: 35)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center)
                    }
                    .frame(width: 375, height: 259)
                    .offset(y:-50)
                    */
                    
                    //NextButton
                    NavigationLink(
                        destination: WatchView(),
                        label: {
                            Image("2next")
                        })
        
                    //Return button
                    NavigationLink(
                        destination: Therapy(),
                        label: {
                            Image("2return")
                        })
                    
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
    
    
    struct Video_Previews: PreviewProvider {
        static var previews: some View {
            Video()
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
                TodoData(title:"Video 1 \nCentral Park People Watching\n",                details: "‘View from Central Park Bench: four seasons of people watching’-- Jim Wroten's latest documentary shot from a single bench on the Mall of Central Park - NYC, July 2012 - June 2013. Original music by Jim Wroten."),
                TodoData(title: "Video 2 \nImagine Cooking\n", details: "Imagine yourself cooking a good vegan meal in under 15 minutes"),
                TodoData(title: "Video 3 \nMontessori Buttoning a Shirt\n", details: "Imagine yourself buttoning a shirt with painfree body control and movements."),
                TodoData(title: "Video 4 \nOpening jars\n", details: "Imagine yourself opening jars with painfree body control and movements."),
                TodoData(title: "Video 5 \nDriving a manual car\n", details: "Imagine yourself driving a manual car with painfree body control and movements."),
                TodoData(title: "Video 6 \nPainting toenails\n", details: "Imagine yourself painting nails with painfree body control and movements.")
            ]
        }
    }
}
