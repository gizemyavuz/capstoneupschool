//
//  SepetTableViewCell.swift
//  Capstone
//
//  Created by Gizem Yavuz on 28.05.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var sepetImage: UIImageView!
    @IBOutlet weak var sepetBilgiLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
