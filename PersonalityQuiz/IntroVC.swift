//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Denis Azarkov on 9/7/23.
//

import UIKit

class IntroVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToQuizIntro(segueTo: UIStoryboardSegue) {
        // кастомный экшен чтобы данный экран считался за норм лендинг и можно было перенаправить сюда с Done
        
    }

}

