//
//  TatliTableViewCell.swift
//  MyKitchen
//
//  Created by Muhammed YILDIRIM  on 16.07.2021.
//

import UIKit

class TatliTableViewCell: UITableViewCell {

    @IBOutlet weak var imageTatliCell: UIImageView!
    @IBOutlet weak var tarifadiTatliCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
