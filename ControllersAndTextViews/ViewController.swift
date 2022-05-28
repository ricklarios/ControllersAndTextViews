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
	@IBOutlet weak var mySegmentedControl: UISegmentedControl!
	@IBOutlet weak var mySlider: UISlider!
	@IBOutlet weak var myStepper: UIStepper!
	@IBOutlet weak var mySwitch: UISwitch!
	
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
		myPickerView.isHidden = true
		
		// PageControls
		
		myPageControl.numberOfPages = myPickerViewValues.count
		myPageControl.currentPageIndicatorTintColor = .blue
		myPageControl.pageIndicatorTintColor = .lightGray
		
		// Segmented Controls
		
		mySegmentedControl.removeAllSegments()
		for (index, value) in myPickerViewValues.enumerated() {
			mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
		}
		
		// Slider
		
		mySlider.minimumTrackTintColor = .red
		mySlider.minimumValue = 1
		mySlider.maximumValue = Float(myPickerViewValues.count)
		mySlider.value = 1
	
	
		// Stepper
	
		myStepper.minimumValue = 1
		myStepper.maximumValue = Double(myPickerViewValues.count)
		
		// Switch
		mySwitch.onTintColor = .purple
		mySwitch.isOn = false
		
		}
	
		
	
	// Actions
	
	// Buttom Actions
	@IBAction func myButtonAction(_ sender: Any) {
		if myButton.backgroundColor == .blue {
			myButton.backgroundColor = .green
		} else {
			myButton.backgroundColor = .blue
		}
	}
	
	// PageControl Actions
	@IBAction func myPageControlAction(_ sender: Any) {
		myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
		
		let myString = myPickerViewValues[myPageControl.currentPage]
		myButton.setTitle(myString, for: .normal)
		
		mySegmentedControl.selectedSegmentIndex = myPageControl.currentPage
		mySlider.value = Float(myPageControl.currentPage + 1)
	}
	
	// SegmentControl Actions
	@IBAction func mySegmentControlAction(_ sender: Any) {
		myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
		
		let myString = myPickerViewValues[mySegmentedControl.selectedSegmentIndex]
		myButton.setTitle(myString, for: .normal)
		
		myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
		mySlider.value = Float(mySegmentedControl.selectedSegmentIndex + 1)
	}
	
	// Slider Actions
	
	@IBAction func mySliderAction(_ sender: Any) {
		
		// print(mySlider.value)
		
		switch mySlider.value {
		case 1..<2:
			mySegmentedControl.selectedSegmentIndex = 0
		case 2..<3:
			mySegmentedControl.selectedSegmentIndex = 1
		case 3..<4:
			mySegmentedControl.selectedSegmentIndex = 2
		case 4..<5:
			mySegmentedControl.selectedSegmentIndex = 3
		default:
			mySegmentedControl.selectedSegmentIndex = 4
		}
		myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
		myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
		let myString = myPickerViewValues[mySegmentedControl.selectedSegmentIndex]
		myButton.setTitle(myString, for: .normal)
		
	}
									
	// Stepper Actions
									
	@IBAction func myStepperAction(_ sender: Any) {
		let value = myStepper.value
		mySlider.value = Float(value)
		myPageControl.currentPage = Int(value - 1)
		mySegmentedControl.selectedSegmentIndex = Int(value - 1)
		myPickerView.selectRow(Int(value - 1), inComponent: 0, animated: true)
		let myString = myPickerViewValues[Int(value - 1)]
		myButton.setTitle(myString, for: .normal)
		
	}
	
	// Switch Actions
	
	@IBAction func mySwitchAction(_ sender: Any) {
		
		if mySwitch.isOn {
			myPickerView.isHidden = false
		} else {
			myPickerView.isHidden = true
		}
	}
	

}

// Delegamos sobre ViewController los protocolos UIPickerView DataSource & Delegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
	// Nº de componentes o columnas
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
   // Nº de filas
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return myPickerViewValues.count
	}
	// Título de cada componente
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return myPickerViewValues[row]
	}
	// Si selecciona esa fila entonces...
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		let myString = myPickerViewValues[row]
		myButton.setTitle(myString, for: .normal)
		
		myPageControl.currentPage = row
		
		mySegmentedControl.selectedSegmentIndex = row
		
		mySlider.value = Float(row + 1)
	}
}



