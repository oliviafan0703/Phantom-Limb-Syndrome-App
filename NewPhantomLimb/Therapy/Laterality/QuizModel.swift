//
//  QuizModel.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/9/21.
//

import Foundation
 
struct QuizModel  {
    var img : String?
    //specify what is the correct answer
    //left = 1, right = 2
    var correct : Int?
}
 
//final quiz is an array of quizmodel
var myQuiz1 : [QuizModel] = [
 
    QuizModel(img: "image1",
    correct: 2),
     
    QuizModel(img: "image2",
    correct: 2),
     
    QuizModel(img: "image3",
    correct: 2),
     
    QuizModel(img: "image4",
    correct: 2),
     
    QuizModel(img: "image5",
    correct: 2),
    
    QuizModel(img: "image6",
    correct: 1),
    
    QuizModel(img: "image7",
    correct: 2),
    
    QuizModel(img: "image8",
    correct: 2),
    
    QuizModel(img: "image9",
    correct: 2),
    
    QuizModel(img: "image10",
    correct: 2),
    
    QuizModel(img: "image11",
    correct: 2),
    
    QuizModel(img: "image12",
    correct: 2),
    
    QuizModel(img: "image13",
    correct: 2),
    
    QuizModel(img: "image14",
    correct: 2),
    
    QuizModel(img: "image15",
    correct: 1),
    
    QuizModel(img: "image16",
    correct: 2),
    
    QuizModel(img: "image17",
    correct: 1),
    
    QuizModel(img: "image18",
    correct: 2),
    
    QuizModel(img: "image19",
    correct: 2),
    
    QuizModel(img: "image20",
    correct: 1),
    
    QuizModel(img: "image21",
    correct: 2),
    
    QuizModel(img: "image21",
    correct: 2),
    
    QuizModel(img: "image22",
    correct: 1),
    
    QuizModel(img: "image23",
    correct: 1),
    
    QuizModel(img: "image24",
    correct: 1),
    
    QuizModel(img: "image25",
    correct: 1),
    
    QuizModel(img: "image26",
    correct: 1),
    
    QuizModel(img: "image27",
    correct: 2),
    
    QuizModel(img: "image28",
    correct: 2),
    
    QuizModel(img: "image29",
    correct: 2),
    
    QuizModel(img: "image30",
    correct: 2),
    
    QuizModel(img: "image31",
    correct: 2),
    
    QuizModel(img: "image32",
    correct: 2),
    
    QuizModel(img: "image33",
    correct: 2),
    
    QuizModel(img: "image34",
    correct: 1),
    
    QuizModel(img: "image35",
    correct: 2),
    
    QuizModel(img: "image36",
    correct: 2),
    
    QuizModel(img: "image37",
    correct: 1),
    
    QuizModel(img: "image38",
    correct: 1),
    
    QuizModel(img: "image39",
    correct: 1),
    
    QuizModel(img: "image40",
    correct: 1),
    
    QuizModel(img: "image41",
    correct: 2),
    
    QuizModel(img: "image42",
    correct: 1)
]
 
func SaveScore(quiz : String , score : Int){
    UserDefaults.standard.set(score, forKey: quiz)
}
 
func LoadScore (quiz : String) -> Int{
    return UserDefaults.standard.integer(forKey: quiz)
}
