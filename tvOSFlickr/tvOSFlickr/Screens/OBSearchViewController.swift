//
//  OBSearchViewController.swift
//  tvOSFlickr
//
//  Created by Oleksandr Borovok on 12/18/17.
//  Copyright © 2017 Oleksandr Borovok. All rights reserved.
//

import UIKit

class OBSearchViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    // MARK: - Action
    @IBAction func searchAction(_ sender: Any) {
        
    }
}

extension OBSearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
