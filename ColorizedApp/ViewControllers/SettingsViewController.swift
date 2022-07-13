//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Андрей on 23.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
	
	// MARK: - IB Outlets
	@IBOutlet var paletteView: UIView!
	
	@IBOutlet var redValueLabel: UILabel!
	@IBOutlet var greenValueLabel: UILabel!
	@IBOutlet var blueValueLabel: UILabel!
	
	@IBOutlet var redSlider: UISlider!
	@IBOutlet var greenSlider: UISlider!
	@IBOutlet var blueSlider: UISlider!
	
	@IBOutlet var redTextField: UITextField!
	@IBOutlet var greenTextField: UITextField!
	@IBOutlet var blueTextField: UITextField!
	
	// MARK: - Public Properties
	var backgroundColor: UIColor!
	var delegate: SettingsViewControllerDelegate!
	
	// MARK: - Life Cycles Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		setupPaletteView()
		setupTextFields()
		
		updateUI()
	}
	
	// MARK: - IB Actions
	@IBAction func sliderValueChanged() {
		updateBackground(
			red: redSlider.value,
			green: greenSlider.value,
			blue: blueSlider.value
		)
	}
	
	@IBAction func doneButtonPressed() {
		delegate.setBackground(backgroundColor)
		dismiss(animated: true)
	}
	
}

// MARK: - Override Methods
extension SettingsViewController {
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		view.endEditing(true)
	}
}

// MARK: - Private Methods
extension SettingsViewController {
	
	private func updateBackground(red: Float, green: Float, blue: Float) {
		backgroundColor = UIColor(
			red: CGFloat(red),
			green: CGFloat(green),
			blue: CGFloat(blue),
			alpha: 1
		)
		updateUI()
	}
	
	private func updateUI() {
		updateLabels()
		updateSliders()
		updateTextFields()
		updatePaletteBackground()
	}
	
	private func updateLabels() {
		redValueLabel.text = String(format: "%.2f", backgroundColor.getRgb().red)
		greenValueLabel.text = String(format: "%.2f", backgroundColor.getRgb().green)
		blueValueLabel.text = String(format: "%.2f", backgroundColor.getRgb().blue)
	}
	
	private func updateSliders() {
		redSlider.setValue(Float(backgroundColor.getRgb().red), animated: true)
		greenSlider.setValue(Float(backgroundColor.getRgb().green), animated: true)
		blueSlider.setValue(Float(backgroundColor.getRgb().blue), animated: true)
	}
	
	private func updateTextFields() {
		redTextField.text = String(format: "%.2f", backgroundColor.getRgb().red)
		greenTextField.text = String(format: "%.2f", backgroundColor.getRgb().green)
		blueTextField.text = String(format: "%.2f", backgroundColor.getRgb().blue)
	}
	
	private func updatePaletteBackground() {
		paletteView.backgroundColor = backgroundColor
	}
	
	private func setupPaletteView() {
		paletteView.layer.cornerRadius = 16
		paletteView.layer.borderColor = UIColor.gray.cgColor
		paletteView.layer.borderWidth = 1
	}
	
	private func setKeyboardToolbar() {
		let bar = UIToolbar()
		bar.items = [
			UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
			UIBarButtonItem(barButtonSystemItem: .done, target: view, action: #selector(UIView.endEditing))
		]
		bar.sizeToFit()
		
		for textField in [redTextField, greenTextField, blueTextField] {
			textField?.inputAccessoryView = bar
		}
	}
	
	private func setupTextFields() {
		for textField in [redTextField, greenTextField, blueTextField] {
			textField?.delegate = self
		}
		setKeyboardToolbar()
	}
	
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		guard let value = Float(textField.text ?? "") else {
			updateTextFields()
			return
		}
		guard (0.0...1.0).contains(value) else {
			updateTextFields()
			return
		}
		
		let red = Float(redTextField.text ?? "") ?? 0
		let green = Float(greenTextField.text ?? "") ?? 0
		let blue = Float(blueTextField.text ?? "") ?? 0
		updateBackground(red: red, green: green, blue: blue)
	}
	
}

extension UIColor {
	
	typealias RGB = (red: CGFloat, green: CGFloat, blue: CGFloat)
	
	func getRgb() -> RGB {
		var red: CGFloat = 0
		var green: CGFloat = 0
		var blue: CGFloat = 0
		var alpha: CGFloat = 0
		getRed(&red, green: &green, blue: &blue, alpha: &alpha)
		
		return (red, green, blue)
	}
	
}

