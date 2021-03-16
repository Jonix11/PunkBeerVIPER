//
//  BeerListWireframe.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit

class BeerListWireframe: BaseWireframe, BeerListWireframeContract {
    
    weak var output: BeerListWireframeOutputContract!
    weak var view: UIViewController!

    func showBeerDetailView(withBeer beer: BeerPresentable) {
        let detailView = BeerDetailBuilder.build(withBeer: beer)
        view.present(detailView, animated: true, completion: nil)
    }
}
