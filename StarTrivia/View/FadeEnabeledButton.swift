//
//  FadeEnabeledButton.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 09/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import Foundation
import UIKit

class FadeEnabledButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.1) {
                     self.alpha = 1.0
                }
             } else {
                UIView.animate(withDuration: 0.1) {
                self.alpha = 0.5
                }
            }
        }
    }
}
