//
//  Solution.swift
//  AlgorithmPractice
//
//  Created by Chloe on 2019/5/29.
//  Copyright © 2019 john.jiang. All rights reserved.
//

import Foundation

class Solution {
    /**
     Given a set of distinct integers, nums, return all possible subsets (the power set).
     
     Note: The solution set must not contain duplicate subsets.
     
     Example:
     
     Input: nums = [1,2,3]
     Output:
     [
        [3],
        [1],
        [2],
        [1,2,3],
        [1,3],
        [2,3],
        [1,2],
        []
     ]
     */
    func subsets(_ nums: [Int]) -> [[Int]] {
        guard nums.count != 0 else {
            return [[]]
        }
        var result = [[Int]]()
        // 递归求解
//        for i in subsets([Int](nums.suffix(from: 1))) {
//            result.append(i)
//            result.append(nums.prefix(upTo: 1) + i)
//        }
        // 位运算
        let n = nums.count
        for i in 0 ..< 1 << n {
            var sub = [Int]()
            for j in 0 ..< n {
                if i >> j & 1 == 1 {
                    sub.append(nums[j])
                }
            }
            result.append(sub)
        }
        return result
    }
}
