//
//  Colors.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 9/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import Foundation
import UIKit

enum Colors {
    case background
    case text
    case censorship
    
    var color: UIColor {
        switch self {
        case .background:
            return UIColor(named: "Background") ?? UIColor()
        case .text:
            return UIColor(named: "Text") ?? UIColor()
        case .censorship:
            return UIColor(named: "Censorship") ?? UIColor()
        }
    }
}
