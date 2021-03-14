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
    func getInitialBeers() -> Promise<[Beer]>
    func getSearchedBeers(withPairingFood food: String) -> Promise<[Beer]>
}

class BeerNetworkProvider: BeerProviderContract {
    
    func getInitialBeers() -> Promise<[Beer]> {
        return Promise<[Beer]> { promise in
            AF.request(PunkAPIConstants.getAbsoluteURL()).responseData { response in
                switch response.result {
                case .failure(let error):
                    promise.reject(error)
                case .success(let value):
                    
//                    do {
//                        let decoder = JSONDecoder()
//                        let beerList = try decoder.decode([Beer].self, from: value)
//                        promise.fulfill(beerList)
//                    } catch {
//                        promise.reject(error)
//                    }
                }
            }
        }
    }
    
    func getSearchedBeers(withPairingFood food: String) -> Promise<[Beer]> {
        return Promise<[Beer]> { promise in
            AF.request(PunkAPIConstants.getBeersURL(withPairingFood: food)).responseData { response in
                switch response.result {
                case .failure(let error):
                    promise.reject(error)
                case .success(let value):
                    do {
                        let decoder = JSONDecoder()
                        let beerList = try decoder.decode([Beer].self, from: value)
                        promise.fulfill(beerList)
                    } catch {
                        promise.reject(error)
                    }
                }
            }
        }
    }
}
