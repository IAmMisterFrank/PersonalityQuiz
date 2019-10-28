//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Frank Solleveld on 28/10/2019.
//  Copyright © 2019 Frank Solleveld. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiLabel4: UILabel!
    @IBOutlet var multiSwitch4: UISwitch!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    var questions: [Question] = [
        Question(text: "Which food do you like the most?", type: .single, answers: [
            Answer(text: "Pasta Vegan", type: .iphone),
            Answer(text: "Bolognese", type: .imac),
            Answer(text: "Pasta Pollo with Pesto", type: .macbook),
            Answer(text: "Ceasar Salad", type: .watch)
        ]),
        Question(text: "Which activities do you enjoy the most?", type: .multiple, answers: [
            Answer(text: "Swimming", type: .watch),
            Answer(text: "Fitness", type: .iphone),
            Answer(text: "Sleeping", type: .imac),
            Answer(text: "Eating", type: .macbook)
        ]),
        Question(text: "How much do you like driving on the freeway?", type: .ranged, answers: [
            Answer(text: "I despise driving at all.", type: .watch),
            Answer(text: "Don't prefer to drive myself but won't complain if I need to drive.", type: .imac),
            Answer(text: "I like driving but not for too long.", type: .macbook),
            Answer(text: "I love driving, prefer to be on the road at all times.", type: .iphone)
        ])
    ]
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn{
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn{
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn{
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn{
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultiStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func nextQuestion() {
        // TODO: Finish this func
    }
    
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultiStack(using answers: [Answer]){
        multipleStackView.isHidden = false
        
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]){
        rangedStackView.isHidden = false
        
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
}
