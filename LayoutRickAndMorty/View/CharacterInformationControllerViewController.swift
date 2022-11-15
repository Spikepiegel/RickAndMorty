//
//  CharacterInformationControllerViewController.swift
//  LayoutRickAndMorty
//
//  Created by Николай Лермонтов on 12.11.2022.
//

import UIKit

class CharacterInformationViewController: UIViewController {

    var fullCharInformation: InformationViewModel?
    
    var characterNameLabel = UILabel()
    var characterStatusLabel = UILabel()
    var characterRaceLabel = UILabel()
    var characterGenderLabel = UILabel()
    var characterImageView = CustomImageView()
    var characterOriginLabel = UILabel()
    var characterLocationLabel = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        guard let model = fullCharInformation else { return }
        characterNameLabel.text = model.name
        configureNameLabel()

    }
    
    
//    func configureCharImage() {
//        if let strUrl = model.image.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
//           let imgUrl = URL(string: strUrl) {
//            characterImageView.download(from: imgUrl)
//        }
//        characterImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(characterImageView)
//        characterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
//
//    }
    
    func configureNameLabel() {
        view.addSubview(characterNameLabel)
        print("KEKEKEKE")

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
