//
//  FancySignInBtn.swift
//  DevslopsSocial
//
//  Created by Ibrahim Adam on 10/15/1438 AH.
//  Copyright © 1438 Ibrahim Adam. All rights reserved.
//

import UIKit

class FancySignInBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = 2.0
    }

}
