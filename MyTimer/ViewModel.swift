//
//  ViewModel.swift
//  MyTimer
//
//  Created by Oleg Lesnoy on 27.10.2024.
//

import Foundation

@Observable
class ViewModel {
    
    private var timerIsRun: Bool = false
    var time = Date()
    
    func getDate(after seconds: Double){
        Thread.detachNewThread {[weak self] in
            self?.timerIsRun = true
            while self?.timerIsRun == true {
                Thread.sleep(forTimeInterval: seconds)
                Foundation.RunLoop.main.perform {
                    self?.time = .now
                }
            }
        }
        
    }
    
    func stopGetDate() {
        timerIsRun = false
    }
}
