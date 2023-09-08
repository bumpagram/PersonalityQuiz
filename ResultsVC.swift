//
//  ResultsVC.swift
//  PersonalityQuiz
//
//  Created by Denis Azarkov on 9/7/23.
//

import UIKit

class ResultsVC: UIViewController {

    @IBOutlet var verdictLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var responses: [Answer]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcResult()
    }
    

    func calcResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) { partialResult, Answer in
            partialResult[Answer.type, default: 0] += 1
            // замыкание, а ля цикл ФОР проходит по всем элементам (destination, source) -> Optional
        }
        
    }
    
    
    

    
    init?(coder: NSCoder, responses: [Answer]){
        self.responses = responses
        super.init(coder: coder)
        // “This new initializer takes two parameters, coder and responses. The coder parameter will be provided and is used by UIKit to initialize your view controller from the information defined in your Storyboard. The responses parameter will be supplied by you, when calling this initializer, and assigned to self.responses which you just added. Finally, the super initializer is called passing through coder. 
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        // “Xcode provides you with a “fix-it” for this problem. Click the “Fix” button to insert the suggested code fix.
       // “In this case, you’re no longer interested in the provided required initializer because you’ll be using your own. This implementation of the required initializer, if called, will now crash your application—you won’t be calling it.
    }
   
    
}// ViewController end
