//
//  RunLoop.swift
//  MyTimer
//
//  Created by Oleg Lesnoy on 27.10.2024.
//

import Foundation

class RunLoop {
    typealias Operation = () -> Void
    private var operations: [Operation] = []
    private var lock = NSLock()
    private var condition = NSCondition()
    private var isStopped: Bool = false
    
    func run() {
        while !isStopped {
            condition.wait()
            
            while let operation = getOperation() {
                operation()
            }
        }
    }
    
    private func getOperation() -> Operation? {
        lock.lock()
        defer {lock.unlock()}
        return !operations.isEmpty ? operations.removeFirst() : nil
    }
    
    func addOperation(operation: @escaping Operation) {
        lock.lock()
        defer {lock.unlock()}
        operations.append(operation)
        condition.signal()
    }
    
    func stop() {
        lock.lock()
        defer {lock.unlock()}
        isStopped = true
        condition.signal()
    }
}
