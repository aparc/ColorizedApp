//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Андрей on 13.07.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
	
	func setBackground(_ color: UIColor)
	
}

class MainViewController: UIViewController {
	
	// MARK: - Private Properties
	private var backgroundColor = UIColor.white
	
	// MARK: - Override Methods
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let settingsVC = segue.destination as? SettingsViewController {
			settingsVC.backgroundColor = backgroundColor
			settingsVC.delegate = self
		}
	}

}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
	func setBackground(_ color: UIColor) {
		backgroundColor = color
		view.backgroundColor = backgroundColor
	}
}


