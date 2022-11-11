//
//  Presenter.swift
//  LayoutRickAndMorty
//
//  Created by Николай Лермонтов on 11.11.2022.
//

import Foundation

protocol PresenterProtocol {
    func viewDidLoad()
}

class Presenter: PresenterProtocol {
    
    
    
    var charInfo = NetworkManager()
    var view: CharactersViewControllerProtocol?
    
    func viewDidLoad() {
        charInfo.getAllCharInformation{ model in
            guard let result = model.results else { return }
            DispatchQueue.main.async {
                self.view?.showCharacter(result: result)
            }
        }
    }
}
