//
//  ViewController.swift
//  TextFieldLeonardo
//
//  Created by Николай Гринько on 26.03.2024.
//

import Foundation
import UIKit

class ViewController: UIViewController {

	private let nameLabel = UILabel(text: "your username",
									textColor: .white,
									size: 16)
	
	private let descriptionLabel = UILabel(text: "Avtomaticalli saves as you change if loft your self roortron",
										   textColor: .gray,
										size: 12)
	
	
	private var customTextField = CustomTextField()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupViews()
		setConstraints()
	}


}

private extension ViewController {
	func setupViews() {
		title = "Hello World"
		view.backgroundColor = .darkGray
		
		view.addSubview(nameLabel)
		view.addSubview(descriptionLabel)
		view.addSubview(customTextField)
	}
	
	func setConstraints() {
		
		NSLayoutConstraint.activate([
		
			nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
			
			descriptionLabel.topAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.bottomAnchor),
			descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
			descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
		
			customTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
			customTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			customTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			customTextField.heightAnchor.constraint(equalToConstant: 40)
			
		])
		
	}
}
