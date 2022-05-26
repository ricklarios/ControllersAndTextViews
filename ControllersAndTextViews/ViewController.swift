//
//  ViewController.swift
//  ControllersAndTextViews
//
//  Created by Cuenta Personal on 27/5/22.
//

import UIKit

class ViewController: UIViewController {
	
	// Outlets

	@IBOutlet weak var myPickerView: UIPickerView!
	@IBOutlet weak var myButton: UIButton!
	
	@IBOutlet weak var myPageControl: UIPageControl!
	// Variables
	
	private let myPickerViewValues = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Buttons
		
		myButton.setTitle("Mi Boton", for: .normal)
		myButton.backgroundColor = .blue
		myButton.setTitleColor(.white, for: .normal)
		
		// Pickers
		
		myPickerView.backgroundColor = .lightGray
		myPickerView.dataSource = self
		myPickerView.delegate = self
		
		// PageControls
		
		myPageControl.numberOfPages = myPickerViewValues.count
		myPageControl.currentPageIndicatorTintColor = .blue
		myPageControl.pageIndicatorTintColor = .lightGray
	}

	// Actions

	@IBAction func myButtonAction(_ sender: Any) {
		if myButton.backgroundColor == .blue {
			myButton.backgroundColor = .green
		} else {
			myButton.backgroundColor = .blue
		}
	}
	@IBAction func myPageControlAction(_ sender: Any) {
		myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
		
		let myString = myPickerViewValues[myPageControl.currentPage]
		myButton.setTitle(myString, for: .normal)
	}
}

// UIPickerView DataSource & Delegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
	// Nº de componentes o columnas
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
// Nº de filas
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return myPickerViewValues.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return myPickerViewValues[row]
	}
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		let myString = myPickerViewValues[row]
		myButton.setTitle(myString, for: .normal)
		
		myPageControl.currentPage = row
	}
}



