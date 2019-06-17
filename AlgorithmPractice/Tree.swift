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
        } else if (lhs!.val != rhs!.val) {
            return false
        } else {
            return isEqual(lhs: lhs?.left, rhs: rhs?.left) && isEqual(lhs: lhs?.right, rhs: rhs?.right)
        }
    }
}
