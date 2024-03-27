//
//  Extension + UIImage.swift
//  TextFieldLeonardo
//
//  Created by Николай Гринько on 27.03.2024.
//

import Foundation
import UIKit


extension UIImage {
	
	func drawLineGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) -> UIImage {
		
		let renderer = UIGraphicsImageRenderer(size: size)
		
		let gradientImage = renderer.image { context in
			context.cgContext.translateBy(x: 0, y: size.height)
			context.cgContext.scaleBy(x: 1, y: -1)
			
			let colors = colors.map { $0.cgColor } as CFArray
			
			let colorSpace = CGColorSpaceCreateDeviceRGB()
			
			guard let gradient = CGGradient(colorsSpace: colorSpace,
											colors: colors,
											locations: nil)
			else { return }
			
			let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
			
			guard let cgImage else { return }
			context.cgContext.clip(to: rect, mask: cgImage)
			context.cgContext.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: .init(rawValue: 1))
		}
		return gradientImage
	}
}
