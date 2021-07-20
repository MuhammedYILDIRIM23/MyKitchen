//
//  HamurisiTableViewCell.swift
//  MyKitchen
//
//  Created by Muhammed YILDIRIM  on 16.07.2021.
//

import UIKit

class HamurisiTableViewCell: UITableViewCell {

    @IBOutlet weak var imageHamurisiCell: UIImageView!
    @IBOutlet weak var tarifadiHamurisiCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
