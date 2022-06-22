//
//  SepetViewController.swift
//  Capstone
//
//  Created by Gizem Yavuz on 27.05.2022.
//

import UIKit

class SepetViewController: UIViewController {

    @IBOutlet weak var sepetTableView: UITableView!
    var sepetListe = [Sepet]()
    var sepetPresenterObje:ViewToPresenterSepetProtocol?
    var kullaniciAdi:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        sepetPresenterObje?.sepetView = self
     
         SepetRouter.createModule(ref: self)
  
    }
  
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterObje?.tumSepetAl(kullanici_adi: "gizem_yavuz")
    
    }


}

extension SepetViewController : PresenterToViewSepetProtocol {
    func viewaVeriGonder(sepetListesi: Array<Sepet>) {
        self.sepetListe = sepetListesi
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
        }
    }
}
extension SepetViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepet = sepetListe[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewCell
        
        hucre.sepetBilgiLabel.text = "\(sepet.yemek_adi!)-\(sepet.yemek_siparis_adet!)adet"
        
        
        let imageUrlString =  "http://kasimadalan.pe.hu/yemekler/resimler/\(sepet.yemek_resim_adi!)"
        let url = URL(string: imageUrlString)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                hucre.sepetImage.image = UIImage(data: data!)
            }
        }
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,void) in
            let sepet = self.sepetListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(sepet.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                
                self.sepetPresenterObje?.Sil(sepet_yemek_id: sepet.sepet_yemek_id!, kullanici_adi: sepet.kullanici_adi!)
                self.sepetPresenterObje?.tumSepetAl(kullanici_adi: "gizem_yavuz")
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    

    
   
}
