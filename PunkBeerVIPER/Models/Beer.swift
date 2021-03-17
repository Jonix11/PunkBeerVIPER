//
//  Beer.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 13/3/21.
//

import Foundation
import ObjectMapper

struct Beer: ImmutableMappable {
    
    let beerId: Int
    let name: String
    let tagline: String?
    let firstBrewed: String?
    let description: String?
    let image: String?
    let abv: Double?
    let foodPairing: [String]?
    
    init(beerId: Int,
         name: String,
         tagline: String? = nil,
         firstBrewed: String? = nil,
         description: String? = nil,
         image: String? = nil,
         abv: Double? = nil,
         foodPairing: [String]? = nil) {
        
        self.beerId = beerId
        self.name = name
        self.tagline = tagline
        self.firstBrewed = firstBrewed
        self.description = description
        self.image = image
        self.abv = abv
        self.foodPairing = foodPairing
    }
    
    init(map: Map) throws {
        beerId = try map.value("id")
        name = try map.value("name")
        tagline = try? map.value("tagline")
        firstBrewed = try? map.value("first_brewed")
        description = try? map.value("description")
        image = try? map.value("image_url")
        abv = try? map.value("abv")
        foodPairing = try? map.value("food_pairing")
    }
    
    func mapping(map: Map) {
        beerId >>> map["id"]
        name >>> map["name"]
        tagline >>> map["tagline"]
        firstBrewed >>> map["first_brewed"]
        description >>> map["description"]
        image >>> map["image_url"]
        abv >>> map["abv"]
        foodPairing >>> map["food_pairing"]
    }
}

protocol BeerPresentable {
    var beerId: Int { get }
    var name: String { get }
    var tagline: String? { get }
    var firstBrewedDate: Date? { get }
    var description: String? { get }
    var imageURL: URL? { get }
    var abv: Double? { get }
    var foodPairing: [String]? { get }
}

extension Beer: BeerPresentable {
    
    var firstBrewedDate: Date? {
        guard let dateString = firstBrewed else {
            return nil
        }
        return DateFormatter.beerAPIDateFormatter.date(from: dateString)
    }
    
    var imageURL: URL? {
        guard let imageString = image else {
            return nil
        }
        guard let url = URL(string: imageString) else {
            return nil
        }
        return url
    }
}
