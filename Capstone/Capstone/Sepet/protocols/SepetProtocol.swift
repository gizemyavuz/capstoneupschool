//
//  SepetProtocol.swift
//  Capstone
//
//  Created by Gizem Yavuz on 28.05.2022.
//

import Foundation

protocol ViewToPresenterSepetProtocol{
    var sepetInteractor:PresenterToInteractorSepetProtocol?{get set}
    var sepetView:PresenterToViewSepetProtocol?{get set}
    func tumSepetAl(kullanici_adi:String)
    func Sil(sepet_yemek_id:String,kullanici_adi:String)
    
}
protocol PresenterToInteractorSepetProtocol{
    var sepetPresenter:InteractorToPresenterSepetProtocol?{get set}
    func sepetAl(kullanici_adi:String)
    func urunSil(sepet_yemek_id:String,kullanici_adi:String)
    
}
protocol InteractorToPresenterSepetProtocol{
    func presenteraVeriGonder(sepetListesi:Array<Sepet>)
    
}
protocol PresenterToViewSepetProtocol{
    func viewaVeriGonder(sepetListesi:Array<Sepet>)
}
protocol PresenterToRouterSepetProtocol{
    static func createModule(ref:SepetViewController)
}
