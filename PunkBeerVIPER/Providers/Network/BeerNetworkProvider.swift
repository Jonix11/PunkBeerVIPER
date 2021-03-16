//
//  BeerNetworkProvider.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//

import Foundation
import Alamofire
import PromiseKit

protocol BeerProviderContract {
    func getInitialBeers() -> Promise<[BeerPresentable]>
    func getSearchedBeers(withPairingFood food: String) -> Promise<[BeerPresentable]>
}

enum BeerNetworkError: Error {
    case initialBeerLoadError
}

class BeerNetworkProvider: BeerProviderContract {
    
    func getInitialBeers() -> Promise<[BeerPresentable]> {
        return Promise<[BeerPresentable]> { promise in
            
            self.getInitialData(withURL: PunkAPIConstants.getAbsoluteURL()).done { initialData in
                let beerList = self.getBeerList(fromData: initialData)
                promise.fulfill(beerList)
            }
        }
    }
    
    func getSearchedBeers(withPairingFood food: String) -> Promise<[BeerPresentable]> {
        return Promise<[BeerPresentable]> { promise in
            
            self.getInitialData(withURL: PunkAPIConstants.getBeersURL(withPairingFood: food)).done { initialData in
                let beerList = self.getBeerList(fromData: initialData)
                promise.fulfill(beerList)
            }
        }
    }
    
    private func getInitialData(withURL url: URL) -> Promise<[[String: Any]]> {
        return Promise<[[String: Any]]> { promise in
            AF.request(url).responseJSON { response in
                guard let initialData = try? response.result.get() as? [[String: Any]] else {
                    promise.reject(BeerNetworkError.initialBeerLoadError)
                    return
                }
                promise.fulfill(initialData)
            }
        }
    }
    
    private func getBeerList(fromData data: [[String: Any]]) -> [BeerPresentable] {
        var beerList = [BeerPresentable]()
        for item in data {
            if let beer = try? Beer(JSON: item) {
                beerList.append(beer)
            }
        }
        return beerList
    }
}
