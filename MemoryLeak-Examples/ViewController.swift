//
//  ViewController.swift
//  MemoryLeak-Examples
//
//  Created by Gerson Janhuel on 14/08/22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "First VC"
    }
    
    
    @IBAction func openSecondVC(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

