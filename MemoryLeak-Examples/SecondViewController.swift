//
//  SecondViewController.swift
//  MemoryLeak-Examples
//
//  Created by Gerson Janhuel on 14/08/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var observer: NSObjectProtocol?
    let networkManager = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "Second VC"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        observer = NotificationCenter.default.addObserver(forName: .saveDate, object: nil, queue: OperationQueue.main, using: { (notification) in
            
            self.dateLabel.text = Date().formatted(date: .abbreviated, time: .shortened)
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    
    @IBAction func selectDate(_ sender: Any) {
        NotificationCenter.default.post(name: .saveDate, object: nil)
        
        networkManager.callANetwork { strings in
            print(strings)
        }
    }
    
    
    deinit {
        print("SecondViewController is de-initialized.")
    }
    
}

extension NSNotification.Name {
    static let saveDate = Notification.Name("saveDate")
}
