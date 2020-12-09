//
//  UITexView + Extensions.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 9/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    
    func dynamicHeight(forWidth width: CGFloat) {
    //This method changes the height constraint in order to fit the whole text inside TextView without scrolling
    //TextView text and height constraint need to be set before using this method.
        self.isScrollEnabled = false
        let size = CGSize(width: width, height: .infinity)
        let estimatedSize = self.sizeThatFits(size)
        
        self.constraints.forEach{ (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}
