//
//  SepetPresenter.swift
//  Capstone
//
//  Created by Gizem Yavuz on 28.05.2022.
//

import Foundation

class SepetPresenter:ViewToPresenterSepetProtocol{
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    var sepetView: PresenterToViewSepetProtocol?
    
    func tumSepetAl(kullanici_adi: String) {
        sepetInteractor?.sepetAl(kullanici_adi:kullanici_adi)
    }
    
    func Sil(sepet_yemek_id: String, kullanici_adi: String) {
       
        sepetInteractor?.urunSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
    
}
extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetListesi: Array<Sepet>) {
        sepetView?.viewaVeriGonder(sepetListesi: sepetListesi)
    }
}
