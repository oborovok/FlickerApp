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
    
    var searchResult = [Any]()
    
    
    // MARK: - Action
    @IBAction func searchAction(_ sender: Any) {
        if let searchText = searchTextField.text {
            OBNetworkManager.searchImage(searchText) { (response, error) in
                if error != nil {
                    return
                }
            }
        }
    }
}

extension OBSearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
