//
//  LRU.swift
//  AlgorithmPractice
//
//  Created by john.jiang on 2019/4/9.
//  Copyright © 2019 john.jiang. All rights reserved.
//

import Foundation

public class LRUCache {
    var linkedList: LinkedList<[AnyHashable: Any]>
    
    init() {
        linkedList = []
    }
}
