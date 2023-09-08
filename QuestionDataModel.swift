//
//  QuestionDataModel.swift
//  PersonalityQuiz
//
//  Created by Denis Azarkov on 9/8/23.
//

import UIKit

class QuestionDataModel: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}



struct Question {
    var text: String
    var type: Response
    var answers: [Answer]
}

enum Response {
    case single, multi, ranged
}

struct Answer {
    var text : String
    var type: Animal
}

enum Animal : Character {  // raw type Char чтобы присвоить значения энумам
    case dog = "🐶"
    case cat = "🐈"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition : String {
        switch self {
        case .dog :
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat :
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms "
        case .rabbit :
            return "You love everything that’s soft. You are healthy and full of energy "
        case .turtle :
            return  "You are wise beyond your years, and you focus on the details. Slow and steady wins the race "
        }
    }
}


