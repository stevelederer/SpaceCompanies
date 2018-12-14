//
//  LSP.swift
//  SpaceCompanies
//
//  Created by Steve Lederer on 12/13/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import Foundation

struct LSP: Codable {
    let agencies: [Agency]
}

struct Agency: Codable {
    let name, countryCode, acronym, website, wikipedia: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case countryCode
        case acronym = "abbrev"
        case website = "infoURL"
        case wikipedia = "wikiURL"
    }
}
