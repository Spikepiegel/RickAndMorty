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
    var locationInformation = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        configureCharImage()
        configureNameLabel()
        configureStatusLabel()
        configureGeneralInformationLabel()
        configureRaceLabel()
        configureGenderLabel()
        configureLocationInformation()
        configureOriginLabel()
        configureLocationLabel()
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
        characterNameLabel.textColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
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
            characterStatusLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            characterStatusLabel.text = "Alive status is unknown"
        }
    }
    
    func configureGeneralInformationLabel() {
        self.view.addSubview(generalInformation)
        generalInformation.text = "General Information"
        generalInformation.translatesAutoresizingMaskIntoConstraints = false
        generalInformation.topAnchor.constraint(equalTo: characterStatusLabel.bottomAnchor, constant: 4).isActive = true
        generalInformation.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        generalInformation.clipsToBounds = true
        generalInformation.textAlignment = .center
        generalInformation.font = UIFont(name: "Noteworthy", size: 25)
        generalInformation.backgroundColor = #colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)
        generalInformation.layer.cornerRadius = 8

    }
    
    func configureRaceLabel() {
        guard let model = model else { return }
        self.view.addSubview(characterRaceLabel)
        characterRaceLabel.text = "\(model.name) is \(model.race)"
        characterRaceLabel.translatesAutoresizingMaskIntoConstraints = false
        characterRaceLabel.topAnchor.constraint(equalTo: generalInformation.bottomAnchor, constant: 4).isActive = true
        characterRaceLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        characterRaceLabel.clipsToBounds = true
        characterRaceLabel.textAlignment = .center
        characterRaceLabel.font = UIFont(name: "Noteworthy", size: 20)
        characterRaceLabel.textColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    }
    
    func configureGenderLabel() {
        guard let model = model else { return }
        self.view.addSubview(characterGenderLabel)
        characterGenderLabel.text = "Gender - \(model.gender)"
        characterGenderLabel.translatesAutoresizingMaskIntoConstraints = false
        characterGenderLabel.topAnchor.constraint(equalTo: characterRaceLabel.bottomAnchor, constant: 4).isActive = true
        characterGenderLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        characterGenderLabel.clipsToBounds = true
        characterGenderLabel.textAlignment = .center
        characterGenderLabel.font = UIFont(name: "Noteworthy", size: 20)
        characterGenderLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func configureLocationInformation() {
        self.view.addSubview(locationInformation)
        locationInformation.text = "Location Infromation"
        locationInformation.translatesAutoresizingMaskIntoConstraints = false
        locationInformation.topAnchor.constraint(equalTo: characterGenderLabel.bottomAnchor, constant: 30).isActive = true
        locationInformation.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        locationInformation.clipsToBounds = true
        locationInformation.textAlignment = .center
        locationInformation.font = UIFont(name: "Noteworthy", size: 25)
        locationInformation.backgroundColor = #colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)
        locationInformation.layer.cornerRadius = 8
    }
    
    func configureOriginLabel() {
        guard let model = model else { return }
        self.view.addSubview(characterOriginLabel)
        if model.origin == "unknown" {
            characterOriginLabel.text = "\(model.name)'s origin planet is unknown"
        } else {
            characterOriginLabel.text = "\(model.name) from \(model.origin)"
        }
        
        characterOriginLabel.translatesAutoresizingMaskIntoConstraints = false
        characterOriginLabel.topAnchor.constraint(equalTo: locationInformation.bottomAnchor, constant: 4).isActive = true
        characterOriginLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        characterOriginLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12).isActive = true
        characterOriginLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12).isActive = true
        characterOriginLabel.clipsToBounds = true
        characterOriginLabel.textAlignment = .center
        characterOriginLabel.numberOfLines = 0
        characterOriginLabel.font = UIFont(name: "Noteworthy", size: 20)
        characterOriginLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func configureLocationLabel() {
        guard let model = model else { return }
        self.view.addSubview(characterLocationLabel)
        characterLocationLabel.text = "Current \(model.name)'s location is \(model.currentLocation)"
        
        characterLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        characterLocationLabel.topAnchor.constraint(equalTo: characterOriginLabel.bottomAnchor, constant: 12).isActive = true
        characterLocationLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        characterLocationLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12).isActive = true
        characterLocationLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12).isActive = true
        characterLocationLabel.clipsToBounds = true
        characterLocationLabel.textAlignment = .center
        characterLocationLabel.numberOfLines = 0
        characterLocationLabel.font = UIFont(name: "Noteworthy", size: 20)
        characterLocationLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
