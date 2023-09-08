//
//  QuestionVC.swift
//  PersonalityQuiz
//
//  Created by Denis Azarkov on 9/7/23.
//

import UIKit

class QuestionVC: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progessView: UIProgressView!
    
    @IBOutlet var singleStack: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var multiStack: UIStackView!
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiLabel4: UILabel!
    
    @IBOutlet var rangedStack: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[indexQuestion].answers //сняли массив в массиве, передали в константу, обратимся по индексу ответов
        
        switch sender {
        case singleButton1 : answersChosen.append(currentAnswers[0])
        case singleButton2 : answersChosen.append(currentAnswers[1])
        case singleButton3: answersChosen.append(currentAnswers[2])
        case singleButton4: answersChosen.append(currentAnswers[3])
        default: break
        }
        nextQuestion()
    }
    
    
    
    
    
    
    var answersChosen = [Answer]() // коллекция ответов от юзера
    //var answers: [Answer] = []
    var indexQuestion = 0

    var questions: [Question] =  [
        Question(
          text: "Which food do you like the most?",
          type: .single,
          answers: [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Carrots", type: .rabbit),
            Answer(text: "Corn", type: .turtle)
          ]
        ),
      
        Question(
          text: "Which activities do you enjoy?",
          type: .multi,
          answers: [
            Answer(text: "Swimming", type: .turtle),
            Answer(text: "Sleeping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Eating", type: .dog)
          ]
        ),
      
        Question(
          text: "How much do you enjoy car rides?",
          type: .ranged,
          answers: [
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get a little nervous", type: .rabbit),
            Answer(text: "I barely notice them", type: .turtle),
            Answer(text: "I love them", type: .dog)
          ]
        )
      ]
    
    func updateUI() {
        singleStack.isHidden = true
        multiStack.isHidden = true
        rangedStack.isHidden = true
        navigationItem.title = "Question #\(indexQuestion + 1)"
        
        let currentQuestion = questions[indexQuestion] // обратились в массив и запросили экземпляр вопроса
        let currentAnswers = currentQuestion.answers // снимаем значения массива, ниже потребуется
        let totalProgress = Float(indexQuestion) / Float(questions.count)

        questionLabel.text = currentQuestion.text
        progessView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single : updateSingleStack(using: currentAnswers)
        case .multi : updateMultiStack(using: currentAnswers)
        case .ranged : updateRangedStack(using: currentAnswers)
        }
        
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStack.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    func updateMultiStack(using answers: [Answer]) {
        multiStack.isHidden = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    func updateRangedStack(using answers: [Answer]) {
        rangedStack.isHidden = false
        rangedLabel1.text = answers.first?.text // проперти коллекции, обращение к первому элементу
        rangedLabel2.text = answers.last?.text // аналогично
    }
    func nextQuestion() {
        // код будет позже 
    }
    
    
    
} // ViewController end


