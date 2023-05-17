//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 15.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultTextLabel: UILabel!
    
    var answersChosen: [Answer]! // передали массив
    
    // Создаем словарь
    
    private var animalCounts: [Animal: Int] = [.dog: 0, .cat: 0, .turtle: 0, .rabbit: 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        // Вызываем методы
        
        getAnswer()
        getSeeResult()
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
        
        
    }
    
    deinit {
        print("ResultViewController is deallocated")
    }
}

private extension ResultViewController {
    
    // Обновляем счетчик животных на основе выбранных ответов
    func getAnswer() {
        answersChosen.forEach { answer in
            if let count = animalCounts[answer.animal] {
                animalCounts[answer.animal] = count + 1
            }
        }
        
    }
    
    // Перебераем словарь
    func getSeeResult()  {
        if let mostFrequentAnimal = animalCounts.max(by: { $0.value < $1.value })?.key {
            resultLabel.text = "Вы - \(mostFrequentAnimal.rawValue)"
            resultTextLabel.text = mostFrequentAnimal.definition
        }
    }
}
        
    
    



