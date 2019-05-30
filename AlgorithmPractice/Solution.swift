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
    
    /**
     Today, the bookstore owner has a store open for customers.length minutes.  Every minute, some number of customers (customers[i]) enter the store, and all those customers leave after the end of that minute.
     
     On some minutes, the bookstore owner is grumpy.  If the bookstore owner is grumpy on the i-th minute, grumpy[i] = 1, otherwise grumpy[i] = 0.  When the bookstore owner is grumpy, the customers of that minute are not satisfied, otherwise they are satisfied.
     
     The bookstore owner knows a secret technique to keep themselves not grumpy for X minutes straight, but can only use it once.
     
     Return the maximum number of customers that can be satisfied throughout the day.
     
     
     
     Example 1:
     
     Input: customers = [1,0,1,2,1,1,7,5], grumpy = [0,1,0,1,0,1,0,1], X = 3
     Output: 16
     Explanation: The bookstore owner keeps themselves not grumpy for the last 3 minutes.
     The maximum number of customers that can be satisfied = 1 + 1 + 1 + 1 + 7 + 5 = 16.
     
     
     Note:
     
     1 <= X <= customers.length == grumpy.length <= 20000
     0 <= customers[i] <= 1000
     0 <= grumpy[i] <= 1
     */
    func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ X: Int) -> Int {
        let n = customers.count
        var max = 0, cur = 0
        for i in 0 ..< n {
            if i < X || grumpy[i] == 0 {
                cur += customers[i]
            }
        }
        max = cur
        if n <= X {
            return max
        }
        for i in 1 ... n - X {
            let left = i, right = i + X - 1
            cur += (grumpy[left - 1] == 1 ? -customers[left - 1] : 0) + (grumpy[right] == 1 ? customers[right] : 0)
            if cur > max {
                max = cur
            }
        }
        return max
    }
}
