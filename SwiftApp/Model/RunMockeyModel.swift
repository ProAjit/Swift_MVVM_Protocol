//
//  RunMockeyModel.swift
//  SwiftApp
//
//  Created by Ajit Satarkar on 13/12/23.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let data: [Datum]
    let included: [Included]
}

// MARK: - Datum
struct Datum: Codable {
    let type, id: String
    let attributes: DatumAttributes
    let relationships: Relationships
}

// MARK: - DatumAttributes
struct DatumAttributes: Codable {
    let title, body, created, updated: String
}

// MARK: - Relationships
struct Relationships: Codable {
    let author: Author
}

// MARK: - Author
struct Author: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id, type: String
}

// MARK: - Included
struct Included: Codable {
    let type, id: String
    let attributes: IncludedAttributes
}

// MARK: - IncludedAttributes
struct IncludedAttributes: Codable {
    let name: String
    let age: Int
    let gender: String
}
