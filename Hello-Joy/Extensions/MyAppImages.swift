//
//  MyAppImages.swift
//  Hello-Joy
//
//  Created by Vuk Radosavljevic on 2/24/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import UIKit


///Helper for image assets
enum MyAppImages: String {
    
    case backButton
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
