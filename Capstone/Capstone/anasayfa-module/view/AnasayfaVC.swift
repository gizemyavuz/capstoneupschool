//
//  ViewController.swift
//  Capstone
//
//  Created by Gizem Yavuz on 23.05.2022.
//

import UIKit
import Alamofire
class AnasayfaVC: UIViewController {

    @IBOutlet weak var yemeklerTableView: UITableView!
    
    var yemeklerListe = [Yemekler]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        yemeklerTableView.delegate = self
        yemeklerTableView.dataSource = self
        anasayfaPresenterNesnesi?.anasayfaView = self
    
        AnasayfaRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetayVC
                gidilecekVC.kisi = kisi
            }
        }
    }*/
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
            self.yemeklerTableView.reloadData()
        }
    }
}

/*extension AnasayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}*/

extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListe[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yemeklerHucre", for: indexPath) as! TableViewHucre
        
        hucre.yemekBilgiLabel.text = "\(yemek.yemek_adi!)- \(yemek.yemek_fiyat!) tl"
        
        let imageUrlString =  "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"
        let url = URL(string: imageUrlString)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                hucre.foodImageView.image = UIImage(data: data!)
            }
        }
        return hucre
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController; // MySecondSecreen the storyboard ID
        vc.yemek = yemek
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(vc, animated: true, completion: nil);
        
    }
   

}


