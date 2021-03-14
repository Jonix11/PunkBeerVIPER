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
        self.getInitialBeerList()
    }
    
    func getInitialBeerList() {
        interactor.getInitialBeerList(onsuccess: { [weak self] (beers) in
            self?.beerList = beers
            self?.view.updateBeerListData(with: beers)
        }, failure: { (error) in
            #warning("TODO")
        })
    }
    
    func getSearchedBeerList(withPairingFood food: String) {
        interactor.getSearchedBeerList(withPairingFood: food, success: { [weak self] (beers) in
            self?.beerList = beers
            self?.view.updateBeerListData(with: beers)
        }, failure: { [weak self] (error) in
            #warning("TODO")
        })
    }
}

// MARK: - BeerListInteractorOutputContract
extension BeerListPresenter: BeerListInteractorOutputContract {
    
}

// MARK: - BeerListWireframeOutputContract
extension BeerListPresenter: BeerListWireframeOutputContract {
    
}
