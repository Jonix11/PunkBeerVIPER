//
//  BeerNetworkProvider.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//

import Foundation
import Alamofire

protocol BeerProviderContract {
    func getInitialBeers(onSuccess success: @escaping ([Beer]) -> Void, failure: @escaping (Error) -> Void)
    func getSearchedBeers(withPairingFood food: String, success: @escaping ([Beer]) -> Void, failure: @escaping (Error) -> Void)
}

class BeerNetworkProvider: BeerProviderContract {
    
    func getInitialBeers(onSuccess success: @escaping ([Beer]) -> Void, failure: @escaping (Error) -> Void) {
        AF.request(PunkAPIConstants.getAbsoluteURL()).responseData { response in
            switch response.result {
            case .failure(let error):
                failure(error)
            case .success(let value):
                do {
                    let decoder = JSONDecoder()
                    let beerList = try decoder.decode([Beer].self, from: value)
                    success(beerList)
                } catch {
                    failure(error)
                }
            }
        }
    }
    
    func getSearchedBeers(withPairingFood food: String, success: @escaping ([Beer]) -> Void, failure: @escaping (Error) -> Void) {
        AF.request(PunkAPIConstants.getBeersURL(withPairingFood: food)).responseData { response in
            switch response.result {
            case .failure(let error):
                failure(error)
            case .success(let value):
                do {
                    let decoder = JSONDecoder()
                    let beerList = try decoder.decode([Beer].self, from: value)
                    success(beerList)
                } catch {
                    failure(error)
                }
            }
        }
    }
}
