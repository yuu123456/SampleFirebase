//
//  TableViewCell.swift
//  SampleFirebase
//
//  Created by 秋山悠 on 2023/02/12.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(title: String, context: String) {
        titleLabel.text = title
        contentLabel.text = context
    }
    
}
