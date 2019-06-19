//
//  Tree.swift
//  AlgorithmPractice
//
//  Created by Chloe on 2019/6/17.
//  Copyright © 2019 john.jiang. All rights reserved.
//

import Foundation

extension TreeNode {
    /**
     递归判断左右子树是否相等
     */
    class func isEqual(lhs: TreeNode?, rhs: TreeNode?) -> Bool {
        if (lhs == nil && rhs != nil) || (lhs != nil && rhs == nil) {
            return false
        } else if (lhs == nil && rhs == nil) {
            return true
        } else {
            return lhs!.val == rhs!.val && isEqual(lhs: lhs?.left, rhs: rhs?.left) && isEqual(lhs: lhs?.right, rhs: rhs?.right)
        }
    }
    
    var symmetric: Bool {
        return isSymmetric(lhs: self, rhs: self)
    }
    /**
     一个树的对称的，意味着其左右子树的根节点值相等，并且其左子树的右子树和右子树的左子树对称
     */
    private func isSymmetric(lhs: TreeNode?, rhs: TreeNode?) -> Bool {
        if (lhs == nil && rhs != nil) || (lhs != nil && rhs == nil) {
            return false
        } else if (lhs == nil && rhs == nil) {
            return true
        } else {
            return lhs!.val == rhs!.val && isSymmetric(lhs: lhs?.left, rhs: rhs?.right) && isSymmetric(lhs: lhs?.right, rhs: rhs?.left)
        }
    }
    
    func reversed() {
        guard let left = left, let right = right else {
            return
        }
        let temp = left
        self.left = right
        self.right = temp
        self.left?.reversed()
        self.right?.reversed()
    }
    
    func levelTravel() -> [Int] {
        var queue = [self], result = [Int]()
        while !queue.isEmpty {
            let node = queue.removeFirst()
            result.append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        return result
    }
    
    func zLevelTravel() -> [Int] {
        var queue = [self], result = [Int](), direction = false
        while !queue.isEmpty {
            var level = [Int]()
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            if direction {
                result.append(contentsOf: level)
            } else {
                result.append(contentsOf: level.reversed())
            }
            direction = !direction
        }
        return result
    }
}
