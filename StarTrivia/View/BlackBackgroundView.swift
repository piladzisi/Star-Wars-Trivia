//
//  BlackBackgroundView.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 09/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import Foundation
import UIKit

class BlackBgView: UIView {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10 
    }
}
