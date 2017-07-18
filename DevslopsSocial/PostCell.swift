//
//  PostCell.swift
//  DevslopsSocial
//
//  Created by Ibrahim Adam on 10/21/1438 AH.
//  Copyright © 1438 Ibrahim Adam. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var likesaLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
