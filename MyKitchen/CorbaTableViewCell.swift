//
//  CorbaTableViewCell.swift
//  MyKitchen
//
//  Created by Muhammed YILDIRIM  on 16.07.2021.
//

import UIKit

class CorbaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCorbaCell: UIImageView!
    @IBOutlet weak var tarifadiCorbaCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
