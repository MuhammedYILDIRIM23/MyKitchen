//
//  AnayemekDetailVC.swift
//  MyKitchen
//
//  Created by Muhammed YILDIRIM  on 15.07.2021.
//

import UIKit
import CoreData


class AnayemekDetailVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var choosenTarifler = ""
    var choosenTariflerId = UUID()
    let picker = UIImagePickerController()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tarifadiText: UITextField!
    @IBOutlet weak var malzemelerText: UITextView!
    @IBOutlet weak var yapilisiText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        
        showData()
        
        //keybord hidden
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeybord))
        imageView.addGestureRecognizer(gesture)
        
        // image
        imageView.isUserInteractionEnabled = true
        let image = UITapGestureRecognizer(target: self, action: #selector(imageSelect))
        imageView.addGestureRecognizer(image)
    }
    
    
    @objc func hideKeybord() {
        view.endEditing(true)
    }
    
    
    func imageGalleryClicked() {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    
    func imageCameraClicked() {
        picker.allowsEditing = true
        picker.sourceType = .camera
        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func showData() {
        if choosenTarifler != "" {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AnayemekTarifleri")
            let idString = choosenTariflerId.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let name = result.value(forKey: "name") as? String {
                            tarifadiText.text = name
                        }
                        if let malzemeler = result.value(forKey: "malzemeler") as? String {
                            malzemelerText.text = malzemeler
                        }
                        if let yapilisi = result.value(forKey: "yapilisi") as? String {
                            yapilisiText.text = yapilisi
                        }
                        if let imageData = result.value(forKey: "resim") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                }
            } catch {
                print("Error")
            }
        } else {
        }
    }
    
    
    @IBAction func kaydetClicked(_ sender: Any) {
        if tarifadiText.text! != "" && malzemelerText.text != "" && yapilisiText.text != ""{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let data = NSEntityDescription.insertNewObject(forEntityName: "AnayemekTarifleri", into: context)
            data.setValue(tarifadiText.text!, forKey: "name")
            data.setValue(malzemelerText.text!, forKey: "malzemeler")
            data.setValue(yapilisiText.text!, forKey: "yapilisi")
            data.setValue(UUID(), forKey: "id")
            let imageData = imageView.image?.jpegData(compressionQuality: 0.5)
            data.setValue(imageData, forKey: "resim")
            do {
                try context.save()
                print("başarılı kaydedildi")
            } catch {
                print("Error")
            }
            NotificationCenter.default.post(name: NSNotification.Name("anayemek"), object: nil)
            self.navigationController?.popViewController(animated: true)
        } else {
            self.makeAlert(titleInput: "Error", messageInput: "Tarif Adi? / Malzemeler? / Yapılışı?")
        }
    }
    
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertButton)
        present(alert, animated: true, completion: nil)
    }
    
    
    @objc func imageSelect() {
        let alert = UIAlertController(title: "Resim Seç", message: "", preferredStyle: .actionSheet)
        let cameraButton = UIAlertAction(title: "Kamerayı aç", style: .default) { UIAlertAction in
            self.imageCameraClicked()
        }
        let galeriButton = UIAlertAction(title: "Galeriden seç", style: .default) { UIAlertAction in
            self.imageGalleryClicked()
        }
        let cancelButton = UIAlertAction(title: "Vazgeç", style: .cancel, handler: nil)
        alert.addAction(cameraButton)
        alert.addAction(galeriButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }
}
