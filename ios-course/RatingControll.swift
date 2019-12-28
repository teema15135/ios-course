//
//  RatingControll.swift
//  ios-course
//
//  Created by odds on 28/12/2562 BE.
//  Copyright © 2562 odds. All rights reserved.
//

import UIKit

@IBDesignable
class RatingControll: UIStackView {
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    private var ratingButtons: [UIButton] = []
    
    var rating = 0
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    private func setupButtons() {
        
        for button in ratingButtons {
            // remove from sub view but still hold
            // the button view (from let button = UIButton())
            removeArrangedSubview(button)
            
            // No one strong hold the button,
            // so the button will be wiped
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let yellowStar = UIImage(named: "yellowStar", in: bundle, compatibleWith: self.traitCollection)
        let blackStar = UIImage(named: "blackStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0 ..< starCount {
            // Create button
            let button = UIButton()
            
            // Set button image
            button.setImage(yellowStar, for: .selected)
            button.setImage(blackStar, for: .normal)

            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true

            // Add the button to the stack
            addArrangedSubview(button)

            // Setup the button action
            button.addTarget(self, action: #selector(RatingControll.ratingButtonTapped(button:)), for: .touchUpInside)
            
            ratingButtons.append(button)
        }
    }
    
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👌🏻")
    }
}
