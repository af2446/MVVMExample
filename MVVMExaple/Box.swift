//
//  Box.swift
//  MVVMExaple
//
//  Created by aviv frenkel on 06/09/2019.
//  Copyright © 2019 aviv frenkel. All rights reserved.
//
//
import Foundation

class Box<T> {
    
    typealias Listener = (T) -> Void
    
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    
    /// function which when initialized will listen to the didSet of the value
    ///
    /// - Parameter listener: returned value
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value) //initial bind call the listener itself
    }
}
