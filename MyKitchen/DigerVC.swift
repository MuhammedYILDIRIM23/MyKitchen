//
//  DigerVC.swift
//  MyKitchen
//
//  Created by Muhammed YILDIRIM  on 14.07.2021.
//

import UIKit
import CoreData


class DigerVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var tarifAdiArray = [String]()
    var uuidArray = [UUID()]
    var imageArray = [Data]()
    var selectedName = ""
    var selectedId = UUID()
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        navigationBarLogo()
        
        getData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        selectedName = ""
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("diger"), object: nil)
    }
    

    @objc func getData() {
        tarifAdiArray.removeAll(keepingCapacity: false)
        uuidArray.removeAll(keepingCapacity: false)
        imageArray.removeAll(keepingCapacity: false)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let getData = NSFetchRequest<NSFetchRequestResult>(entityName: "DigerTarifleri")
        getData.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(getData)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    if let name = result.value(forKey: "name") as? String {
                        tarifAdiArray.append(name)
                    }
                    if let id = result.value(forKey: "id") as? UUID {
                        uuidArray.append(id)
                    }
                    if let resim = result.value(forKey: "resim") as? Data {
                        self.imageArray.append(resim)
                    }
                    self.table.reloadData()
                }
            }
        } catch {
            print("Error")
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarifAdiArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DigerTableViewCell
        newCell.imageDigerCell.image = UIImage(data: imageArray[indexPath.row]) //important
        newCell.tarifadiDigerCell.text = tarifAdiArray[indexPath.row]
        newCell.backgroundColor = UIColor.white
        newCell.layer.borderColor = UIColor.black.cgColor
        newCell.layer.borderWidth = 1
        newCell.layer.cornerRadius = 8
        newCell.clipsToBounds = true
        return newCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = tarifAdiArray[indexPath.row]
        selectedId = uuidArray[indexPath.row]
        selectedImage = UIImage(data: imageArray[indexPath.row])!
        performSegue(withIdentifier: "toDigerDetailVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDigerDetailVC" {
            let destinatonVC = segue.destination as! DigerDetailVC
            destinatonVC.choosenTarifler = selectedName
            destinatonVC.choosenTariflerId = selectedId
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DigerTarifleri")
            let idString = uuidArray[indexPath.row].uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetchRequest.returnsObjectsAsFaults = false
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let id = result.value(forKey: "id") as? UUID {
                            if id == uuidArray[indexPath.row] {
                                context.delete(result)
                                tarifAdiArray.remove(at: indexPath.row)
                                uuidArray.remove(at: indexPath.row)
                                self.table.reloadData()
                                do {
                                    try context.save()
                                }catch{
                                    print("Error")
                                }
                                break
                            }
                        }
                    }
                }
            }catch{
                print("ERROR")
            }
        }
    }
    

    func navigationBarLogo() {
        let logo = UIImage(named: "diger")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        navigationController?.navigationBar.barTintColor = UIColor(red: 240.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 0.5)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tarif Ekle", style: .plain, target: self, action: #selector(addButton))
    }
    
    
    @objc func addButton() {
        performSegue(withIdentifier: "toDigerDetailVC", sender: nil)
    }
}
