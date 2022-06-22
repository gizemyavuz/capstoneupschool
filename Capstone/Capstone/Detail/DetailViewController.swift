//
//  DetailViewController.swift
//  Capstone
//
//  Created by Gizem Yavuz on 27.05.2022.
//

import Foundation
import UIKit
import Alamofire

class DetailViewController: UIViewController {
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    var foodCount: Int = 1
    var yemek: Yemekler!
    var yemekadet: String = "1"
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // foodImageView.image
        descriptionLabel.text = yemek.yemek_adi
        
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.foodImageView.image = UIImage(data: data!)
            }
        }

    }
    
    
    @IBAction func foodCounter(_ sender: UIStepper) {
        let foodCount = Int(sender.value)
        countLabel.text = String(foodCount)
    }
    
    
    @IBAction func addToBasketAction(_ sender: Any) {
        let fc = countLabel.text
        let params:Parameters = ["yemek_adi":yemek.yemek_adi!,"yemek_resim_adi":yemek.yemek_resim_adi!,"yemek_fiyat":yemek.yemek_fiyat!,"yemek_siparis_adet":fc!,"kullanici_adi":"gizem_yavuz"]
        
        print(params)
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).response { response in
            if let data  = response.data {
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                }catch{ print(error.localizedDescription) }
            }
        }
        
    }
}
