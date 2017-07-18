//
//  CircleView.swift
//  DevslopsSocial
//
//  Created by Ibrahim Adam on 10/21/1438 AH.
//  Copyright © 1438 Ibrahim Adam. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func layoutSubviews() {
        
        layer.cornerRadius = self.frame.width / 2
    }
}
