//
//  CharactersModel.swift
//  LayoutRickAndMorty
//
//  Created by Николай Лермонтов on 11.11.2022.
//

import Foundation

// MARK: - Model
struct Model: Decodable {
    let info: Info?
    let results: [Result]?
    //let prev: JSONNull?
}

// MARK: - Info
struct Info: Decodable {
    let count, pages: Int
    let next: String
}

// MARK: - Result
struct Result: Decodable {
    let id: Int?
    let name: String
    let status: Status
    let species: Species
    let type: String?
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Decodable {
    let name: String
    let url: String
}

enum Species: String, Decodable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

//class JSONNull: Decodable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
