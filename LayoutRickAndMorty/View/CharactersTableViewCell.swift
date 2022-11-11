//
//  CharacterTableViewCell.swift
//  LayoutRickAndMorty
//
//  Created by Николай Лермонтов on 11.11.2022.
//

import Foundation
import UIKit

class CharactersTableViewCell: UITableViewCell {
    
    var characterImageView = CustomImageView()
    var characterNameLabel = UILabel()
    var characterLiveStatus = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(characterImageView)
        addSubview(characterNameLabel)
        addSubview(characterLiveStatus)
        
        configureImageView()
        configureNameLabel()
        configureLiveStatus()
        setImageConstraints()
        setNameLabelConstraints()
        setStatusLabelConstaints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init(coder:) has not been implemented")
    }
    
    func set(model: Result) {
        characterNameLabel.text = model.name
        characterLiveStatus.text = model.status?.rawValue
        if let strUrl = model.image.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
           let imgUrl = URL(string: strUrl) {
            characterImageView.download(from: imgUrl)
        }
    }
    
    func configureImageView() {
        characterImageView.layer.cornerRadius = 10
        characterImageView.clipsToBounds = true
    }
    
    func configureNameLabel() {
        characterNameLabel.numberOfLines = 0
        characterNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureLiveStatus() {
        characterLiveStatus.numberOfLines = 0
        characterLiveStatus.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        characterImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        characterImageView.widthAnchor.constraint(equalTo: characterImageView.heightAnchor, multiplier: 16/16).isActive = true
    }
    
    func setNameLabelConstraints() {
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20).isActive = true
        characterNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        characterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        characterNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func setStatusLabelConstaints() {
        characterLiveStatus.translatesAutoresizingMaskIntoConstraints = false
        characterLiveStatus.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20).isActive = true
        characterLiveStatus.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: -20).isActive = true
        characterLiveStatus.backgroundColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
        characterLiveStatus.layer.cornerRadius = 5
        characterLiveStatus.clipsToBounds = true

    }
}
