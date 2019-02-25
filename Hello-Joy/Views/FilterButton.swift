//
//  FilterButton.swift
//  Practice
//
//  Created by Vuk Radosavljevic on 2/23/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import UIKit

@IBDesignable
class FilterButton: UIButton {

    @IBInspectable override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .mainPurple : nil
            setTitleColor(UIColor.white, for: .selected)
        }
    }
    
    override func awakeFromNib() {
        layer.cornerRadius = bounds.height / 2
        self.addTarget(self, action: #selector(didTap), for: .touchDown)
    }
    

    @objc func didTap() {
        isSelected = !isSelected
    }
}

extension Array where Element == FilterButton {
    func setAllToUnselected() {
        self.forEach { (button) in
            button.isSelected = false
        }
    }
}

