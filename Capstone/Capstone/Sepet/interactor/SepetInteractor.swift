//
//  SepetInteractor.swift
//  Capstone
//
//  Created by Gizem Yavuz on 28.05.2022.
//

import Foundation
import Alamofire

class SepetInteractor:PresenterToInteractorSepetProtocol{
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func sepetAl(kullanici_adi: String) {
        let params:Parameters = ["kullanici_adi":kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).response { response in
            if let data  = response.data {
                do{
                    let res = try JSONDecoder().decode(SepetCevap.self, from: data)
                    
                   // let cevap = try JSONSerialization.jsonObject(with: data)
                   // print(cevap)
                    //buradan veriyi gonder anasayfadaki gibi
                    if let liste = res.sepet_yemekler{
                        self.sepetPresenter?.presenteraVeriGonder(sepetListesi: liste)
                    }
                
                }catch{
                    print(error.localizedDescription) }
            }
        }
        
    }
    
    func urunSil(sepet_yemek_id: String, kullanici_adi: String) {
        let params:Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post,  parameters: params).response { response in
                    if let data = response.data {
                        do{
                            let res = try JSONDecoder().decode(SepetCevap.self, from: data)
                            print(res)
                            if let list = res.sepet_yemekler{
                                self.sepetPresenter?.presenteraVeriGonder(sepetListesi : list)
                            }
                        }catch{
                            print(error.localizedDescription)
                            print(String(describing: error))
                        }
                    }
    }
    
    
}
}
