//
//  BeerDetailPresenter.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class BeerDetailPresenter: BasePresenter, BeerDetailPresenterContract {

    weak var view: BeerDetailViewContract!
    var interactor: BeerDetailInteractorContract!
    var entity: BeerDetailEntityContract!
    var wireframe: BeerDetailWireframeContract!

    func viewDidLoad() {

    }

    func viewWillAppear() {
        let beerData = interactor.getBeerData()
        view.reloadBeerData(withBeer: beerData)
    }
}

// MARK: - BeerDetailInteractorOutputContract
extension BeerDetailPresenter: BeerDetailInteractorOutputContract {
    
}

// MARK: - BeerDetailWireframeOutputContract
extension BeerDetailPresenter: BeerDetailWireframeOutputContract {
    
}
