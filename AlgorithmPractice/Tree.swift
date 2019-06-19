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
}
