//
//  List.swift
//  AlgorithmPractice
//
//  Created by Chloe on 2019/6/16.
//  Copyright © 2019 john.jiang. All rights reserved.
//

import Foundation

// MARK: - Works Applications
extension List {
    func threshold(_ k: Int) -> List {
        var current = head, previous: Node?, large: Node?, largeCurrent = large
        while current != nil {
            if current!.val >= k {
                if large == nil {
                    large = current
                    largeCurrent = large
                } else {
                    largeCurrent?.next = current
                    largeCurrent = largeCurrent?.next
                }
                if previous == nil {
                    head = head?.next
                    current?.next = nil
                    current = head
                } else {
                    previous?.next = current?.next
                    current?.next = nil
                    current = previous?.next
                }
            } else {
                previous = current
                current = current?.next
            }
            if current == nil {
                previous?.next = large
            }
        }
        return self
    }
}
