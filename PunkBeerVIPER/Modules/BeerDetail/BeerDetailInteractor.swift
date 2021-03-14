//
//  BeerDetailInteractor.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class BeerDetailInteractor: BaseInteractor, BeerDetailInteractorContract {
    weak var output: BeerDetailInteractorOutputContract!

    var networkProvider: BeerProviderContract
    var beer: Beer
    
    init (provider: BeerProviderContract, beer: Beer) {
        self.networkProvider = provider
        self.beer = beer
    }
    
    func getBeerData() -> Beer {
        return beer
    }
}
