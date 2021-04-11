//
//  SecondViewController + Extension.swift
//  LoginCoreAnimation
//
//  Created by Mikhail on 10.04.2021.
//

import UIKit

extension SecondViewController {
    
    // MARK: - Animations
    func shakeLabel() {
        helloLabel.animation = "shake"
        helloLabel.curve = "easyInOut"
        helloLabel.duration = 3
        helloLabel.scaleX = 3
        helloLabel.scaleX = 3
        helloLabel.rotate = 3
        helloLabel.damping = 0.5
        helloLabel.velocity = 0.5
        helloLabel.animate()
        
        helloLabel.text = " This is a 'Shake' animation with rotate "
    }
    
    func popLabel() {
        helloLabel.animation = "pop"
        helloLabel.curve = "linear"
        helloLabel.duration = 1
        helloLabel.animate()
        
        helloLabel.text = " This is a 'Pop' animation "
    }
    
    func swingLabel() {
        helloLabel.animation = "swing"
        helloLabel.curve = "spring"
        helloLabel.force = 2.5
        helloLabel.duration = 2
        helloLabel.scaleX = 1.2
        helloLabel.scaleY = 1.2
        helloLabel.velocity = 0
        helloLabel.animate()
        
        helloLabel.text = " This is a 'Swing' animation "
    }
}
