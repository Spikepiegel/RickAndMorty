//
//  ViewController.swift
//  LayoutRickAndMorty
//
//  Created by Николай Лермонтов on 10.11.2022.
//

import UIKit

protocol CharactersViewControllerProtocol {
    func showCharacter(result: [Result])
}

class CharactersViewController: UIViewController, CharactersViewControllerProtocol {
    
    let charactersTableView = UITableView()
    var rickModel = [Result]()
    var presenter: PresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assembly()
        presenter?.viewDidLoad()
        
        // MARK: Table View Configuration
        configureTableView()
        
        
        // MARK: ViewController Personalization
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Characters"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    // MARK: Table View Constaints
    func configureTableView() {
        view.addSubview(charactersTableView)
        setTableViewDelegates()
        charactersTableView.rowHeight = 100
        charactersTableView.register(CharactersTableViewCell.self,
                                     forCellReuseIdentifier: "CharactersCell")
        charactersTableView.pin(to: view)
        
    }

    func setTableViewDelegates() {
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
    }

    func showCharacter(result: [Result]) {
        self.rickModel = result
        charactersTableView.reloadData()
    }
    
    private func assembly() {
        let presenter = Presenter()
        presenter.view = self
        self.presenter = presenter
    }
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rickModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = charactersTableView.dequeueReusableCell(withIdentifier: "CharactersCell") as! CharactersTableViewCell
        let character = rickModel[indexPath.row]
        cell.set(model: character)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = CharacterInformationViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
    
}
