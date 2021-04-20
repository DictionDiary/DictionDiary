//
//  WordCell.swift
//  DictionDiary
//
//  Created by Dasia scott on 4/20/21.
//

import UIKit

class WordCell: UITableViewCell {

    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var WOD: UILabel!
    @IBOutlet weak var Definition: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

