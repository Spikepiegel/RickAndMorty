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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        configureCharImage()
        configureNameLabel()
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
        characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 12).isActive = true
        //characterNameLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        characterNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12).isActive = true
        characterNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 12).isActive = true
        characterNameLabel.numberOfLines = 0
        characterNameLabel.textAlignment = .center
    }
    
    func configureStatusLabel() {
        
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
