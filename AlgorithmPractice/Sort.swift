//
//  Sort.swift
//  AlgorithmPractice
//
//  Created by john.jiang on 2019/4/2.
//  Copyright © 2019 john.jiang. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    /// 插入排序
    mutating func insertionSorted() {
        for i in 1 ..< count {
            for j in (0 ..< i).reversed() where self[j] > self[j + 1] {
                (self[j], self[j + 1]) = (self[j + 1], self[j])
            }
        }
    }
    
    mutating func heapSorted() {
        /// 堆的当前节点的左节点
        func leftOf(_ i: Int) -> Int {
            return i << 1 + 1
        }
        /// 堆的当前节点的右节点
        func rightOf(_ i: Int) -> Int {
            return i << 1 + 2
        }
        
        /// 维持最大堆
        /// 找到当前节点的最大子节点并与父节点交换，递归完成最大堆
        /// - Parameters:
        ///   - current: 当前需调整的节点
        func maintainMaxHeap<Element: Comparable>(_ array: inout Array<Element>, _ length: Int, _ current: Int) {
            let left = leftOf(current), right = rightOf(current)
            var largest = current
            if left < length, array[left] > array[largest] {
                largest = left
            }
            if right < length, array[right] > array[largest] {
                largest = right
            }
            if largest != current {
                (array[largest], array[current]) = (array[current], array[largest])
                maintainMaxHeap(&array, length, largest)
            }
        }
        /// 构建最大堆
        func buildMaxHeap<Element: Comparable>(_ array: inout Array<Element>) {
            for i in (0 ... array.count >> 1).reversed() {
                maintainMaxHeap(&array, array.count, i)
            }
        }
        
        // Implementation
        buildMaxHeap(&self)
        var heapLength = count
        while heapLength > 0 {
            (self[0], self[heapLength - 1]) = (self[heapLength - 1], self[0])
            heapLength -= 1
            maintainMaxHeap(&self, heapLength, 0)
        }
    }
    
    mutating func quickSorted() {
        func quickSort<Element: Comparable>(_ array: inout Array<Element>, _ start: Int, _ end: Int) {
            guard start < end else {
                return
            }
            let pivot = array[start]
            var i = start, j = end
            while i < j {
                while i < j, array[j] >= pivot {
                    j -= 1
                }
                if i < j {
                    array[i] = array[j]
                    i += 1
                }
                while i < j, array[i] < pivot {
                    i += 1
                }
                if i < j {
                    array[j] = array[i]
                    j -= 1
                }
            }
            array[i] = pivot
            quickSort(&array, start, i - 1)
            quickSort(&array, i + 1, end)
        }
        quickSort(&self, 0, count - 1)
    }
}
