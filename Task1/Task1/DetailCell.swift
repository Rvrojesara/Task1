//
//  DetailCell.swift
//  Task1
//
//  Created by admin on 03/10/24.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var punchlinelable: UILabel!
    @IBOutlet weak var setuplable: UILabel!
    @IBOutlet weak var typelable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
