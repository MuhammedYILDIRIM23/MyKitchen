//
//  SalataTableViewCell.swift
//  MyKitchen
//
//  Created by Muhammed YILDIRIM  on 16.07.2021.
//

import UIKit

class SalataTableViewCell: UITableViewCell {

    @IBOutlet weak var imageSalataCell: UIImageView!
    @IBOutlet weak var tarifadiSalataCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
