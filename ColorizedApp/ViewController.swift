//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Андрей on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - IB Outlets
	@IBOutlet var paletteView: UIView!
	
	@IBOutlet var redValueLabel: UILabel!
	@IBOutlet var greenValueLabel: UILabel!
	@IBOutlet var blueValueLabel: UILabel!
	
	@IBOutlet var redSlider: UISlider!
	@IBOutlet var greenSlider: UISlider!
	@IBOutlet var blueSlider: UISlider!
	
	// MARK: - Life Cycles Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		setupSliders()
		setupLabels()
		setPaletteView()
	}
	
	// MARK: - IB Actions
	@IBAction func sliderValueChanged(_ sender: UISlider) {
		switch sender.tag {
		case 0:
			redValueLabel.text = String(format: "%.2f", redSlider.value)
		case 1:
			greenValueLabel.text = String(format: "%.2f", greenSlider.value)
		default:
			blueValueLabel.text = String(format: "%.2f", blueSlider.value)
		}
		setPaletteBackground()
	}
	
	
	// MARK: - Private Methods
	private func setPaletteBackground() {
		paletteView.backgroundColor = UIColor.init(
			red: CGFloat(redSlider.value),
			green: CGFloat(greenSlider.value),
			blue: CGFloat(blueSlider.value),
			alpha: 1.0
		)
	}
	
	private func setupSliders() {
		redSlider.value = Float.random(in: 0...1.0)
		greenSlider.value = Float.random(in: 0...1.0)
		blueSlider.value = Float.random(in: 0...1.0)
	}
	
	private func setupLabels() {
		redValueLabel.text = String(format: "%.2f", redSlider.value)
		greenValueLabel.text = String(format: "%.2f", greenSlider.value)
		blueValueLabel.text = String(format: "%.2f", blueSlider.value)
	}
	
	private func setPaletteView() {
		paletteView.layer.cornerRadius = 16
		paletteView.layer.borderColor = UIColor.gray.cgColor
		paletteView.layer.borderWidth = 1
		setPaletteBackground()
	}
}

