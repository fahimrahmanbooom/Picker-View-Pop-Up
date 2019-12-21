//
//  ViewController.swift
//  Picker View Pop Up
//
//  Created by Fahim Rahman on 21/12/19.
//  Copyright © 2019 Fahim Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Outlets
    
    @IBOutlet weak var textField: UITextField!
    
    // Creating elements for the pickerView
    
    let days: [String] = [
        
        "Saturday",
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday"
    ]
    
    var selectedItem: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker()
        toolBar()
    }
    
    // Creating pickerview
    
    func picker() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        textField.inputView = pickerView

        pickerView.backgroundColor = .systemOrange
    }
    
    // Creating toolbar
    
    func toolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        toolBar.barTintColor = .white
        toolBar.tintColor = .black
        
        textField.inputAccessoryView = toolBar
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    // PickerView Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return days.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return days[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedItem = days[row]
        textField.text = selectedItem
    }
}
