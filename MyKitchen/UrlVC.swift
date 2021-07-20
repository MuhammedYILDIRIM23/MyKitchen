//
//  UrlVC.swift
//  MyKitchen
//
//  Created by Muhammed YILDIRIM  on 18.07.2021.
//

import UIKit

class UrlVC: UIViewController {

    let searchRefika = "https://www.refikaninmutfagi.com"
    let searchYemek = "https://yemek.com"
    let searchNefis = "https://www.nefisyemektarifleri.com"
    let searchLezzet = "https://www.lezzet.com.tr"
    
    @IBOutlet weak var refikaButton: UIButton!
    @IBOutlet weak var yemekButton: UIButton!
    @IBOutlet weak var nefisButton: UIButton!
    @IBOutlet weak var lezzetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttoncustomization(buttonName: refikaButton)
        buttoncustomization(buttonName: yemekButton)
        buttoncustomization(buttonName: nefisButton)
        buttoncustomization(buttonName: lezzetButton)
    }
    
    
    @IBAction func refikaClicked(_ sender: Any) {
        openWebSite(openUrl: searchRefika)
    }
    
    
    @IBAction func yemekClicked(_ sender: Any) {
        openWebSite(openUrl: searchYemek)
    }
    
    
    @IBAction func nefisClicked(_ sender: Any) {
        openWebSite(openUrl: searchNefis)
    }
    
    
    @IBAction func lezzetClicked(_ sender: Any) {
        openWebSite(openUrl: searchLezzet)
    }
    
    
    func openWebSite(openUrl: String) {
        guard let url = URL(string: openUrl) else {
          return
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    
    func buttoncustomization(buttonName: UIButton) {
        buttonName.layer.cornerRadius = 4
        buttonName.layer.borderWidth = 2
        buttonName.layer.borderColor = UIColor.purple.cgColor
    }
}
