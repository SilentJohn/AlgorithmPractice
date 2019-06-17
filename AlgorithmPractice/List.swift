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
    /**
     给出链表，给出k，将小于k的放置在前面，其余保持不变
     124521，k=3  -> 122145
     */
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
    
    func rotateRight(_ k: Int) -> List {
        var front = head, count = 0
        while front != nil {
            front = front?.next
            count += 1
        }
        front = head
        var back = head, tail: Node?, i = 0
        let offset = k % count
        guard offset != 0 else {
            return self
        }
        while front != nil {
            if i > offset {
                back = back?.next
            }
            front = front?.next
            i += 1
            if front != nil, front?.next == nil {
                tail = front
            }
        }
        tail?.next = head
        head = back?.next
        back?.next = nil
        return self
    }
}
