//
//  ContactTableViewCell.swift
//  ExampleMoya
//
//  Created by izul on 02/05/18.
//  Copyright © 2018 Rinjani. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var address: UILabel!
    
    var item: Contact? {
        didSet {
            name?.text = item?.name
            email?.text = item?.email
            address?.text = item?.address
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
