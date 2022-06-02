//
//  DoorViewController.swift
//  HW 2.10 (2) Gnilitskiy
//
//  Created by Александр on 19.05.2022.
//

import UIKit

class DoorViewController: UIViewController {
    
    @IBAction func charactersAction(_ sender: Any) {
        let alert = UIAlertController(
            title: "it is too early",
            message: "open books",
            preferredStyle: .alert
        )
        
        let okAlert = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAlert)
        present(alert, animated: true)
    }
}
