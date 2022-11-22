//
//  ViewController.swift
//  LayoutRickAndMorty
//
//  Created by Николай Лермонтов on 10.11.2022.
//

import UIKit

protocol CharactersViewControllerProtocol {
    func showCharacter(result: [Result])
    func showMoreCharacters(result: [Result])
}

class CharactersViewController: UIViewController, CharactersViewControllerProtocol {
    
    
    
    private var charactersTableView = UITableView()
    var searchBar = UISearchBar()

    var rickModel = [Result]()
    var searchModel = [Result]()
    var presenter: PresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        // MARK: Table View Configuration
        configureTableView()

        
        // MARK: ViewController Personalization
        configureUI()
        
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

    // MARK: Cancel Button On The Search Bar
    @objc func handleShowSearchBar() {
        search(shouldShow: true )
        searchBar.becomeFirstResponder()
        
    }
    // MARK: Configures CharactersViewController
    func configureUI() {
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.placeholder = "Search..."
        searchBar.tintColor = .white
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Characters"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        showSearchBarButton(shouldShow: true)
        
    }
    
    // MARK: Sets Table View Delegates
    func setTableViewDelegates() {
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
    }

    // MARK: Shows All Characters With Usibg Api Request
    func showCharacter(result: [Result]) {
        self.rickModel = result
        self.searchModel = result
        charactersTableView.reloadData()
    }
    
    func showMoreCharacters(result: [Result]) {
        self.rickModel += result
        self.searchModel += result
        charactersTableView.reloadData()
    }
    
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                     target: self,
                                                                     action: #selector(handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil

        }
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
   
}

// MARK: Controls Table View Conditions
extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = charactersTableView.dequeueReusableCell(withIdentifier: "CharactersCell") as! CharactersTableViewCell
        let character = searchModel[indexPath.row]
        cell.set(model: character)
        
        if indexPath.row == searchModel.count - 1 {
            presenter?.tableViewDidScrolledBottom()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = CharacterInformationViewController()
        let character = searchModel[indexPath.row]
        navigationController?.pushViewController(destination, animated: true)
        let model = InformationViewModel(name: character.name,
                                     status: character.status.rawValue,
                                         race: character.species ?? "unkwn",
                                     gender: character.gender ?? "unknkown",
                                     image: character.image,
                                     origin: character.origin.name,
                                     currentLocation: character.location.name)
        destination.model = model
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue)
    }
    
    
    
}

// MARK: Controls Search Bar Conditions
extension CharactersViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchModel = rickModel
        charactersTableView.reloadData()
        searchBar.text = nil
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchModel.removeAll()
        if let text = searchBar.text {
            searchModel = rickModel.filter { $0.name.contains(text) }
        }
        if searchBar.text == "" {
            searchModel = rickModel
        }
        charactersTableView.reloadData()
    }
}
