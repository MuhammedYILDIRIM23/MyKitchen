//
//  SearchVCViewController.swift
//  MyKitchen
//
//  Created by Muhammed YILDIRIM  on 17.07.2021.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    @IBOutlet weak var image10: UIImageView!
    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var image12: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tapGesture(imageNo: image1)
        tapGesture(imageNo: image2)
        tapGesture(imageNo: image3)
        tapGesture(imageNo: image4)
        tapGesture(imageNo: image5)
        tapGesture(imageNo: image6)
        tapGesture(imageNo: image7)
        tapGesture(imageNo: image8)
        tapGesture(imageNo: image9)
        tapGesture(imageNo: image10)
        tapGesture(imageNo: image11)
        tapGesture(imageNo: image12)
    }
    
    
    func tapGesture(imageNo: UIImageView) {
        imageNo.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageClicked))
        imageNo.addGestureRecognizer(tapGesture)
    }
    
    
    
    @objc func imageClicked() {
        performSegue(withIdentifier: "toUrlVC", sender: nil)
    }
    
     
}
