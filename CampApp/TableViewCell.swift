//
//  TableViewCell.swift
//  CampApp
//
//  Created by Максим Лисица on 18/05/2019.
//  Copyright © 2019 Максим Лисица. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelNumStep: UILabel!
    @IBOutlet weak var labelAboutStep: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
