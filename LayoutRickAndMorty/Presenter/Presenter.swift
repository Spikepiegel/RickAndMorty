//
//  Presenter.swift
//  LayoutRickAndMorty
//
//  Created by Николай Лермонтов on 11.11.2022.
//

import Foundation

protocol PresenterProtocol {
    func viewDidLoad()
    func tableViewDidScrolledBottom()
}

class Presenter: PresenterProtocol {
    
    
    
    var charInfo = NetworkManager()
    var view: CharactersViewControllerProtocol?
    var counter = 1
    var maxCount = 0
    
    func viewDidLoad() {
        charInfo.getAllCharInformation{ model in
            guard let result = model.results else { return }
            self.maxCount = model.info?.pages ?? 0
            DispatchQueue.main.async {
                self.view?.showCharacter(result: result)
            }
        }
    }
    
    func tableViewDidScrolledBottom() {
        counter += 1
        if counter > maxCount {
            print("All data have loaded") // Добавить UIAlert 
            return
        }
        charInfo.getAdditionalCharInformation(page: counter, completion: { model in
            guard let result = model.results else { return }
            DispatchQueue.main.async {
                self.view?.showMoreCharacters(result: result)
            }
        })
    }
        
}
