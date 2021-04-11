//
//  ViewController.swift
//  LoginCoreAnimation
//
//  Created by Mikhail on 09.04.2021.
//

import UIKit


class LoginViewController: UIViewController, CAAnimationDelegate, UITextFieldDelegate {
    
    // MARK: - Properties
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 13
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = #colorLiteral(red: 0.2180606723, green: 0.2752656043, blue: 0.6701844335, alpha: 1).cgColor
            shapeLayer.strokeColor = color
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineWidth = 13
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0
            let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            overShapeLayer.strokeColor = color
        }
    }
    // MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userImageView: UIImageView! {
        didSet {
            userImageView.layer.cornerRadius = userImageView.frame.size.height / 2
            let borderColor = UIColor.white
            userImageView.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBOutlet weak var loginTextField: UITextField! {
        didSet {
            loginTextField.updateUI()
            loginTextField.placeholder = "Please enter your name"
        }
    }
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.updateUI()
            loginButton.layer.cornerRadius = 5
        }
    }
    
    // MARK: - Lifecycle + Subview
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer)
        
        view.addGradient()
        
        loginTextField.delegate = self
        
        registerForKeyboardNotifications()
        addDoneButtonTo()
    }
    deinit {
        removeKeyboardNotifications()
    }
    
    override func viewDidLayoutSubviews() {
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
    }
    
    // MARK: - Functions
    @IBAction func tapped(_ sender: UIButton) {
        if loginTextField.text?.isEmpty == true {
            let pulse = CASpringAnimation(keyPath: "transform.scale")
            pulse.duration = 0.3
            pulse.fromValue = 0.95
            pulse.toValue = 1
            pulse.autoreverses = true
            pulse.initialVelocity = 0.5
            pulse.damping = 1
            
            loginTextField.layer.add(pulse, forKey: nil)
        } else {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.toValue = 1
            animation.duration = 3
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            animation.fillMode = CAMediaTimingFillMode.both
            
            animation.delegate = self
            
            overShapeLayer.add(animation, forKey: nil)
        }
    }
    
    private func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let rect = CGRect(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 - 290, width: 200, height: 200)
        let path = UIBezierPath(ovalIn: rect)
        shapeLayer.path = path.cgPath
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        tapped(loginButton)
        
        return false
    }
    
    func animationDidStop(_ anim: CAAnimation,
                          finished flag: Bool) {
        performSegue(withIdentifier: "showSecondScreen", sender: self)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondScreen" {
            let secondViewController = segue.destination as? SecondViewController
            secondViewController?.name = loginTextField.text
        }
    }
}

