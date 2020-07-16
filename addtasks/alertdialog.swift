//
//  alertdialog.swift
//  addtasks
//
//  Created by Diellza Bajrami on 7/15/20.
//  Copyright © 2020 dardan bakiu. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .cancel, handler: nil)
        alert.addAction(action)
        
        DispatchQueue.main.async {
           self.present(alert, animated: true, completion: nil)
        }
    }
}
