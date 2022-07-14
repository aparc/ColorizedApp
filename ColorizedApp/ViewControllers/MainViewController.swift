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
	
	// MARK: - Override Methods
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let settingsVC = segue.destination as? SettingsViewController {
			settingsVC.backgroundColor = view.backgroundColor
			settingsVC.delegate = self
		}
	}

}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
	func setBackground(_ color: UIColor) {
	
		view.backgroundColor = color
	}
}


