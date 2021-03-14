//
//  BeerListPresenter.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

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
        firstly {
            interactor.getInitialBeerList()
        }.done { [weak self] beerList in
            self?.beerList = beerList
            self?.view.updateBeerListData(with: beerList)
        }.catch { [weak self] error in
            #warning("TODO")
        }
    }
    
    func getSearchedBeerList(withPairingFood food: String) {
        firstly {
            interactor.getSearchedBeerList(withPairingFood: food)
        }.done { [weak self] beerList in
            self?.beerList = beerList
            self?.view.updateBeerListData(with: beerList)
        }.catch { [weak self] error in
            #warning("TODO")
        }
    }
    
    func beerSelected(in index: Int) {
        let beer = beerList[index]
        wireframe.showBeerDetailView(withBeer: beer)
    }
}

// MARK: - BeerListInteractorOutputContract
extension BeerListPresenter: BeerListInteractorOutputContract {
    
}

// MARK: - BeerListWireframeOutputContract
extension BeerListPresenter: BeerListWireframeOutputContract {
    
}
