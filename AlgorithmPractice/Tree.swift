//
//  Tree.swift
//  AlgorithmPractice
//
//  Created by Chloe on 2019/6/17.
//  Copyright © 2019 john.jiang. All rights reserved.
//

import Foundation

extension TreeNode {
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
    private func isSymmetric(lhs: TreeNode?, rhs: TreeNode?) -> Bool {
        if (lhs == nil && rhs != nil) || (lhs != nil && rhs == nil) {
            return false
        } else if (lhs == nil && rhs == nil) {
            return true
        } else {
            return lhs!.val == rhs!.val && isSymmetric(lhs: lhs?.left, rhs: rhs?.right) && isSymmetric(lhs: lhs?.right, rhs: rhs?.left)
        }
    }
}
