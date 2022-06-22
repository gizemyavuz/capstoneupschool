//
//  SepetRouter.swift
//  Capstone
//
//  Created by Gizem Yavuz on 28.05.2022.
//

import Foundation

class SepetRouter:PresenterToRouterSepetProtocol{
    static func createModule(ref: SepetViewController) {
            let presenter = SepetPresenter()
               
        ref.sepetPresenterObje = presenter
        ref.sepetPresenterObje?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterObje?.sepetView = ref
        ref.sepetPresenterObje?.sepetInteractor?.sepetPresenter = presenter
    }
    
    
}
