//
//  AnasayfaVCViewController.swift
//  MyKitchen
//
//  Created by Muhammed YILDIRIM  on 14.07.2021.
//

import UIKit

class AnasayfaVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarLogo()
    }
    
    
    func navigationBarLogo() {
        let logo = UIImage(named: "anasayfa")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        navigationController?.navigationBar.barTintColor = UIColor(red: 240.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 0.5)
    }
    

}
