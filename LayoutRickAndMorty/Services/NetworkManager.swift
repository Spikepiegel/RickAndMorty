//
//  Networkmanager.swift
//  LayoutRickAndMorty
//
//  Created by Николай Лермонтов on 11.11.2022.
//

import UIKit

struct NetworkManager {

    func getAllCharInformation(completion: @escaping (Model) -> ()) {
        let urlString = "https://rickandmortyapi.com/api/character/"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let saved: Model = try JSONDecoder().decode(Model.self, from: data)
                print("success decodered")
                //print(saved)
                completion(saved)
            } catch {
                print("error")
                print(error)
            }
        }.resume()
    }
    
    func getAdditionalCharInformation(page: Int, completion: @escaping (Model) -> ()) {
        let urlString = "https://rickandmortyapi.com/api/character/?page=\(page)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let saved: Model = try JSONDecoder().decode(Model.self, from: data)
                print("success decodered")
                //print(saved)
                completion(saved)
            } catch {
                print("error")
                print(error)
            }
        }.resume()
    }
    
}
