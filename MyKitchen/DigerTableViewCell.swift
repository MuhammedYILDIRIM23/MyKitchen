//
//  DigerTableViewCell.swift
//  MyKitchen
//
//  Created by Muhammed YILDIRIM  on 16.07.2021.
//

import UIKit

class DigerTableViewCell: UITableViewCell {

    @IBOutlet weak var imageDigerCell: UIImageView!
    @IBOutlet weak var tarifadiDigerCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
