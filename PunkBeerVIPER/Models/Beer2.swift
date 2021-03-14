//
//  Beer.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//

//import Foundation
//
//struct Beer2 {
//    let beerId: Int
//    let name: String
//    let tagline: String?
//    let firstBrewed: Date?
//    let description: String?
//    let imageURL: URL?
//    let abv: Double?
//    let foodPairing: [String]?
//    
//    init(beerId: Int,
//         name: String,
//         tagline: String? = nil,
//         firstBrewed: Date? = nil,
//         description: String? = nil,
//         imageURL: URL? = nil,
//         abv: Double? = nil,
//         foodPairing: [String]? = nil) {
//        
//        self.beerId = beerId
//        self.name = name
//        self.tagline = tagline
//        self.firstBrewed = firstBrewed
//        self.description = description
//        self.imageURL = imageURL
//        self.abv = abv
//        self.foodPairing = foodPairing
//    }
//    
//}
//
//extension Beer2: Decodable {
//    
//    enum CodingKeys: String, CodingKey {
//        case beerId = "id"
//        case name
//        case tagline
//        case firstBrewed = "first_brewed"
//        case description
//        case imageURL = "image_url"
//        case abv
//        case foodPairing = "food_pairing"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        beerId = try container.decode(Int.self, forKey: .beerId)
//        name = try container.decode(String.self, forKey: .name)
//        tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
//        
//        if let firstBrewedString = try container.decodeIfPresent(String.self, forKey: .firstBrewed) {
//            firstBrewed = DateFormatter.beerAPIDateFormatter.date(from: firstBrewedString)
//        } else {
//            firstBrewed = nil
//        }
//        
//        description = try container.decodeIfPresent(String.self, forKey: .description)
//        imageURL = try container.decodeIfPresent(URL.self, forKey: .imageURL)
//        abv = try container.decodeIfPresent(Double.self, forKey: .abv)
//        foodPairing = try container.decodeIfPresent([String].self, forKey: .foodPairing)
//    }
//}
