//
//  UIView+extensions.swift
//  ViewCode
//
//  Created by Sandra Monteiro de Castro on 23/03/22.
//

import Foundation
import UIKit

extension UIView {
    
    public func addSubviews(_ subviewa: UIView...) {
        subviews.forEach(addSubview)
    }
}
