//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Erik Sebastian de Erice Jerez on 7/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var totalQuestions = 10
    var questionsAsked = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = [
            "estonia",
            "france",
            "germany",
            "ireland",
            "italy",
            "monaco",
            "nigeria",
            "poland",
            "spain",
            "uk",
            "us"
        ]
        
        setupView()
        askQuestion()
    }
    
    func setupView() {
        NSLayoutConstraint.activate([
            button1.widthAnchor.constraint(equalToConstant: 200),
            button2.widthAnchor.constraint(equalToConstant: 200),
            button3.widthAnchor.constraint(equalToConstant: 200),
            button1.heightAnchor.constraint(equalToConstant: 100),
            button2.heightAnchor.constraint(equalToConstant: 100),
            button3.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        if questionsAsked == totalQuestions {
            let ac = UIAlertController(title: "Game Over", message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: restart))
            present(ac, animated: true)
        }
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) | Score: \(score)"
        
        questionsAsked += 1
    }
    
    func restart(action: UIAlertAction! = nil) {
        score = 0
        questionsAsked = 0
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        let selectedCountry = countries[sender.tag]
        
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct!"
            message = "Your score is \(score)."
        } else {
            score -= 1
            title = "Wrong!"
            message = "That's the flag of \(selectedCountry.uppercased()). Your score is \(score)."
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}
