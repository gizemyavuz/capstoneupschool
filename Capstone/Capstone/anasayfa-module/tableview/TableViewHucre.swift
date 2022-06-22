//
//  TableViewHucre.swift
//  Capstone
//
//  Created by Gizem Yavuz on 26.05.2022.
//

import UIKit

class TableViewHucre: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var yemekBilgiLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
