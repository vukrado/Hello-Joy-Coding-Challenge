//
//  AnswerButton.swift
//  Hello-Joy
//
//  Created by Vuk Radosavljevic on 2/24/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import UIKit

@IBDesignable
class AnswerButton: UIButton {
    
    
    @IBInspectable override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.backgroundColor = self.isSelected ? .mainPurple : nil
            }
            setTitleColor(UIColor.white, for: .selected)
        }
    }
    
    @IBInspectable override open var isHighlighted: Bool {
        didSet {
            if !isSelected {
                backgroundColor = isHighlighted ? .highligtedPurple : nil
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
}

extension Array where Element == AnswerButton {
    func setAllToUnselected() {
        self.forEach { (button) in
            button.isSelected = false
        }
    }
}

