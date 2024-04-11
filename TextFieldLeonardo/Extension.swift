//
//  Extension.swift
//  TextFieldLeonardo
//
//  Created by Николай Гринько on 26.03.2024.
//


import UIKit

extension UILabel {
	
	convenience init(text: String, textColor: UIColor, size: CGFloat) {
		self.init()
		self.text = text
		self.textColor = textColor
		self.font = .systemFont(ofSize: size)
		self.translatesAutoresizingMaskIntoConstraints = false
	}
	
}
