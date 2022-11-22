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
}

// MARK: - Info
struct Info: Decodable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Result: Decodable {
    let id: Int?
    let name: String
    let status: Status
    //let species: Species?
    let species, type: String?
    //let type: String?
    let gender: String?
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
    case humanoid = "Humanoid"
    case unknown = "unknown"
}

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}


