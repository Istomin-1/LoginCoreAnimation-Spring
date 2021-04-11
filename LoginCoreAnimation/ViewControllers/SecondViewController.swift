//
//  SecondViewController.swift
//  LoginCoreAnimation
//
//  Created by Mikhail on 09.04.2021.
//

import UIKit
import Spring


class SecondViewController: UIViewController {
    
    var name: String!
    
    enum Animations: String {
        case pop
        case swing
        case shake
    }
    
    var currentAnimation: Animations = .pop
    
    @IBOutlet weak var cancelButton: SpringLabel! {
        didSet {
            cancelButton.updateUI()
        }
    }
    
    @IBOutlet weak var helloLabel: SpringLabel! {
        didSet {
            helloLabel.updateUI()
        }
    }
    
    @IBOutlet weak var startButton: SpringButton! {
        didSet {
            startButton.updateUI()
            startButton.layer.cornerRadius = 5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGradient()
        helloLabel.text = "Hello \(name!). Let's see different animations?"
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedStartButton(_ sender: SpringButton) {
        switch currentAnimation {
        case .pop:
            popLabel()
            currentAnimation = .shake
        case .shake:
            shakeLabel()
            currentAnimation = .swing
        case .swing:
            swingLabel()
            currentAnimation = .pop
        }
        startButton.setTitle("Next", for: .normal)
    }
}
