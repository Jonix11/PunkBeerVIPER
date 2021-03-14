//
//  BeerListInteractor.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class BeerListInteractor: BaseInteractor, BeerListInteractorContract {
    
    weak var output: BeerListInteractorOutputContract!

    var networkProvider: BeerProviderContract
    
    init (provider: BeerProviderContract) {
        self.networkProvider = provider
    }
    
    // MARK: - Public methods
    func getInitialBeerList() -> Promise<[Beer]> {
        return Promise<[Beer]> { promise in
            firstly {
                self.networkProvider.getInitialBeers()
            }.done { beerList in
                promise.fulfill(beerList)
            }
        }
    }
    
    func getSearchedBeerList(withPairingFood food: String) -> Promise<[Beer]> {
        return Promise<[Beer]> { promise in
            firstly {
                self.networkProvider.getSearchedBeers(withPairingFood: food)
            }.done { beerList in
                promise.fulfill(beerList)
            }
        }
    }
}
