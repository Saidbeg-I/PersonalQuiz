//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

final class ResultViewController: UIViewController {
 
    // MARK: - IBOutlet Properties
    @IBOutlet var backBarButtonItem: UINavigationItem!
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var discriptionAnswerLabel: UILabel!
    
    // 1. Передать массив с ответами на экран с результатами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
     
    // MARK: - Private Properties
    
   var sumAnswers: [Answer] = []
   var answer: Answer!
    
//   var resultLabel = currentAnswer.type.rawValue.description
//   var discriptionLabel = currentAnswer.type.definition
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backBarButtonItem.hidesBackButton = true
        answer = resultAnswer(with: sumAnswers)
        resultAnswerLabel.text = "ВЫ - \(answer.type.rawValue),"
        discriptionAnswerLabel.text = "\(answer.type.definition)"
        
    }
    
    // MARK: - Action
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    //MARK: -
    private func resultAnswer(with answers: [Answer]) -> Answer {
        var currentAnswer: Answer!
        
        var answerDog: [Answer] = []
        var answerCat: [Answer] = []
        var answerRabbit: [Answer] = []
        var answerTurtle: [Answer] = []
        
        for answer in answers {
            switch answer.type {
            case .dog:
                answerDog.append(answer)
            case .cat:
                answerCat.append(answer)
            case .rabbit:
                answerRabbit.append(answer)
            case .turtle:
                answerTurtle.append(answer)
            }
        }
            
            if answerDog.count >= 2 {
                currentAnswer = answerDog.first
            } else if answerCat.count >= 2 {
                currentAnswer = answerCat.first
            } else if answerRabbit.count >= 2 {
                currentAnswer = answerRabbit.first
            } else if answerTurtle.count >= 2 {
                currentAnswer = answerTurtle.first
            }
        return  currentAnswer
    }
}
