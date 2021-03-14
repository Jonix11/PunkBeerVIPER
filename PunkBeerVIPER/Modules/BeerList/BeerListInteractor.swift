//
//  BeerListInteractor.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class BeerListInteractor: BaseInteractor, BeerListInteractorContract {
    
    weak var output: BeerListInteractorOutputContract!

    var networkProvider: BeerProviderContract
    
    init (provider: BeerProviderContract) {
        self.networkProvider = provider
    }
    
    // MARK: - Public methods
    func getInitialBeerList(onsuccess success: @escaping ([Beer]) -> Void, failure: @escaping (Error) -> Void) {
        networkProvider.getInitialBeers(onSuccess: { (beers) in
            assert(Thread.current == Thread.main)
            success(beers)
        }, failure: { (error) in
            assert(Thread.current == Thread.main)
            failure(error)
        })
    }
    
    func getSearchedBeerList(withPairingFood food: String, success: @escaping ([Beer]) -> Void, failure: @escaping (Error) -> Void) {
        networkProvider.getSearchedBeers(withPairingFood: food, success: { (beers) in
            assert(Thread.current == Thread.main)
            success(beers)
        }, failure: { (error) in
            assert(Thread.current == Thread.main)
            failure(error)
        })
    }
}
