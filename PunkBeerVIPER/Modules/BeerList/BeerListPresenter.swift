//
//  BeerListPresenter.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class BeerListPresenter: BasePresenter, BeerListPresenterContract {

    weak var view: BeerListViewContract!
    var interactor: BeerListInteractorContract!
    var entity: BeerListEntityContract!
    var wireframe: BeerListWireframeContract!
    
    var beerList = [Beer]()

    func viewDidLoad() {

    }

    func viewWillAppear() {
        interactor.getInitialBeerList(onsuccess: { [weak self] (beers) in
            self?.beerList = beers
            self?.view.updateBeerListData(with: beers)
        }, failure: { (error) in
            
        })
    }
}

// MARK: - BeerListInteractorOutputContract
extension BeerListPresenter: BeerListInteractorOutputContract {
    
}

// MARK: - BeerListWireframeOutputContract
extension BeerListPresenter: BeerListWireframeOutputContract {
    
}
