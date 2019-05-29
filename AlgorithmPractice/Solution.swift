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
    
    /**
     Some people will make friend requests. The list of their ages is given and ages[i] is the age of the ith person.
     
     Person A will NOT friend request person B (B != A) if any of the following conditions are true:
     
     age[B] <= 0.5 * age[A] + 7
     age[B] > age[A]
     age[B] > 100 && age[A] < 100
     Otherwise, A will friend request B.
     
     Note that if A requests B, B does not necessarily request A.  Also, people will not friend request themselves.
     
     How many total friend requests are made?
     
     Example 1:
     
     Input: [16,16]
     Output: 2
     Explanation: 2 people friend request each other.
     Example 2:
     
     Input: [16,17,18]
     Output: 2
     Explanation: Friend requests are made 17 -> 16, 18 -> 17.
     Example 3:
     
     Input: [20,30,100,110,120]
     Output:
     Explanation: Friend requests are made 110 -> 100, 120 -> 110, 120 -> 100.
     
     
     Notes:
     
     1 <= ages.length <= 20000.
     1 <= ages[i] <= 120.
     */
    func numFriendRequests(_ ages: [Int]) -> Int {
        var dict = [Int: Int]()
        for i in ages {
            guard let val = dict[i] else {
                dict[i] = 1
                continue
            }
            dict[i] = val + 1
        }
        
        var result = 0
        for (i, val) in dict {
            // 条件1得出发出请求的最小年龄为15
            if i >= 15 {
                result += val * (val - 1)
            }
            if i >= 16, val != 0 {
                for j in i / 2 + 8 ..< i {
                    guard let value = dict[j] else {
                        continue
                    }
                    result += val * value
                }
            }
        }
        return result
    }
}
