//
//  CustomTextField.swift
//  TextFieldLeonardo
//
//  Created by Николай Гринько on 26.03.2024.
//

import Foundation
import UIKit

enum ValiState {
	case start
	case loading
	case result
}

class CustomTextField: UITextField {
	
	private var timer = Timer()
	private let loginName = "Like"
	
	// Сдвигается вправо
	override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
		CGRect(x: 0, y: 0, width: 40, height: frame.height)
	}
	
	// Сдвигается влево от правого края
	override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
		CGRect(x: frame.width - 40, y: 0, width: 40, height: frame.height)
	}
	
	private var textFieldState: ValiState = .start {
		didSet {
			switch textFieldState {
				case .start:
					rightView = nil
				case .loading:
					rightViewLoadingConfigure()
				case .result:
					if text == loginName {
						rightImageViewConfigure(imageName: "multiply.circle", tintColor: .red)
					} else {
						rightImageViewConfigure(imageName: "checkmark.circle", tintColor: .green)
					}
			}
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
		leftImageViewConfigure()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	@objc private func stopTyping() {
		textFieldState = .loading
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.textFieldState = .result
		}
	}
}

extension CustomTextField: UITextFieldDelegate {
	
	//
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		timer.invalidate()
		
		guard let text, let textRange = Range(range, in: text) else { return true }
		let updateText = text.replacingCharacters(in: textRange, with: string)
	
		if updateText.isEmpty {
			textFieldState = .start
			return true
		}
		
		timer = Timer.scheduledTimer(timeInterval: 0.5,
									 target: self,
									 selector: #selector(stopTyping),
									 userInfo: nil,
									 repeats: false)
		return true
	}
}


extension CustomTextField {
	
	func configure() {
		
		borderStyle = .none
		backgroundColor = .systemGray
		layer.cornerRadius = 10
		tintColor = .lightGray
		textColor = .white
		leftViewMode = .always
		rightViewMode = .always
		translatesAutoresizingMaskIntoConstraints = false
		
		delegate = self
	}
	
	func leftImageViewConfigure() {
		let leftImageView = UIImageView()
		leftImageView.contentMode = .center
		leftImageView.image = UIImage(systemName: "at")?
		
			.drawLineGradient(colors: [.red, .blue], startPoint: .init(x: 0, y: 0), endPoint: .init(x: 5, y: 40))
		
		leftView = leftImageView
	}
	
	func rightViewLoadingConfigure() {
		let rightLoadingView = UIActivityIndicatorView()
		rightLoadingView.startAnimating()
		rightLoadingView.color = .lightGray
		rightView = rightLoadingView
	}
	
	func rightImageViewConfigure(imageName: String, tintColor: UIColor) {
		let rightImageView = UIImageView()
		rightImageView.contentMode = .center
		rightImageView.tintColor = tintColor
		rightImageView.image = UIImage(systemName: imageName)
		rightView = rightImageView
		
	}
}
