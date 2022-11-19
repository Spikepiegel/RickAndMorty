//
//  CharacterInformationControllerViewController.swift
//  LayoutRickAndMorty
//
//  Created by Николай Лермонтов on 12.11.2022.
//

import UIKit

class CharacterInformationViewController: UIViewController {

    let characterNameLabel = UILabel()
    var characterStatusLabel = UILabel()
    var characterRaceLabel = UILabel()
    var characterGenderLabel = UILabel()
    var characterImageView = CustomImageView()
    var characterOriginLabel = UILabel()
    var characterLocationLabel = UILabel()
    var model: InformationViewModel?
    
    var generalInformation = UILabel()
    var currentLocation = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        configureCharImage()
        configureNameLabel()
        configureStatusLabel()
    }
    
    
    func configureCharImage() {
        self.view.addSubview(characterImageView)
        guard let model = model else { return }

        if let strUrl = model.image.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
           let imgUrl = URL(string: strUrl) {
            characterImageView.download(from: imgUrl)
        }
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120).isActive = true
        characterImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12).isActive = true
        characterImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12).isActive = true
        characterImageView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        characterImageView.layer.cornerRadius = 10
        characterImageView.clipsToBounds = true

    }
    
    func configureNameLabel() {
        guard let model = model else { return }
        self.view.addSubview(characterNameLabel)
        
        characterNameLabel.text = model.name
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 16).isActive = true
        characterNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12).isActive = true
        characterNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12).isActive = true
        characterNameLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        characterNameLabel.font = UIFont(name: "Rockwell", size: 20)
        characterNameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        characterNameLabel.numberOfLines = 0
        characterNameLabel.textAlignment = .center
    }
    
    func configureStatusLabel() {
        guard let model = model else { return }
        self.view.addSubview(characterStatusLabel)
        
        characterStatusLabel.text = model.status
        characterStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        characterStatusLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 0).isActive = true
        characterStatusLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12).isActive = true
        characterStatusLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12).isActive = true
        characterStatusLabel.numberOfLines = 0
        characterStatusLabel.textAlignment = .center
        characterStatusLabel.font = UIFont(name: "Noteworthy", size: 25)
        if characterStatusLabel.text == "Alive" {
            characterStatusLabel.textColor = #colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)
        } else if characterStatusLabel.text == "Dead" {
            characterStatusLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        } else {
            characterStatusLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    func configureGeneralInformationLabel() {
        generalInformation.text = "General Information"
        
    }
    
    func configureRaceLabel() {
        
    }
    
    func configureGenderLabel() {
        
    }
    
    func configureOriginLabel() {
        
    }
    
    func configureLocationLabel() {
        
    }
}
