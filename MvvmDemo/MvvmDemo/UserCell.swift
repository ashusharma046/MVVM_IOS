//
//  UserCell.swift
//  MvvmDemo
//
//  Created by ashu sharma on 2/17/19.
//  Copyright © 2019 AshuSharma. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userID : UILabel!
    @IBOutlet weak var idValue : UILabel!
    @IBOutlet weak var title : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nibForCell() ->UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: String(describing: self), bundle: bundle)
    }
    
    
    func setupUI(with user: User){
        title?.text = user.title
        idValue?.text = "\(user.id)"
        userID?.text = "\(user.userId)"
    }
}
