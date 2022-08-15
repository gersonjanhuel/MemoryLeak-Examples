//
//  NetworkManager.swift
//  MemoryLeak-Examples
//
//  Created by Gerson Janhuel on 14/08/22.
//

import Foundation

class NetworkManager {
    var recordFinishedTime: () -> Void  = {
        print(Date().formatted())
    }
    
    func callANetwork(with completion: @escaping ([String]) -> Void) {
        // dummy network call for 5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let strings = ["String1", "String2"]
            self.recordFinishedTime()
            completion(strings)
        }
    }
    
    deinit {
        print("NetworkManager is de-initialized.")
    }
}
