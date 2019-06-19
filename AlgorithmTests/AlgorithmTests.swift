//
//  AlgorithmTests.swift
//  AlgorithmTests
//
//  Created by john.jiang on 2019/4/15.
//  Copyright © 2019 john.jiang. All rights reserved.
//

import XCTest
@testable import AlgorithmPractice

class AlgorithmTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        solution = Solution()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    var linkedList: BiLinkedList<Int>?
    
    func testLinkedListCreate() {
        linkedList = [1, 2, 3]
        XCTAssertNotNil(linkedList, "链表初始化失败")
    }
    
    func testLinkedListCreateWithEmptyArray() {
        linkedList = []
        XCTAssert(linkedList!.isEmpty, "链表应该没有数据")
    }
    
    func testLinkedListRemoveNode() {
        linkedList = [1, 2, 3, 4, 5]
        XCTAssertNotNil(linkedList, "链表初始化失败")
        linkedList?.remove(at: 1)
        XCTAssert(linkedList![1].value == 3, "删除节点失败")
    }
    
    func testSubsets() {
        let nums = [1, 2, 3]
        let result = solution.subsets(nums)
        XCTAssert(Set(result) == Set([[3], [1], [2], [1,2,3], [1,3], [2,3], [1,2], []]))
    }
    
    func testMyQueue() {
        let obj = MyQueue()
        obj.push(1)
        obj.push(2)
        let ret_1: Int = obj.peek()
        XCTAssert(ret_1 == 1)
        obj.push(3)
        let ret_2: Int = obj.peek()
        XCTAssert(ret_2 == 1)
    }
    
    func testNumFriendRequests() {
        XCTAssert(solution.numFriendRequests([20, 30, 100, 110, 120]) == 3)
        XCTAssert(solution.numFriendRequests([16, 17, 18]) == 2)
    }
    
    func testMaxSatisfied() {
        XCTAssert(solution.maxSatisfied([1, 0, 1, 2, 1, 1, 7, 5], [0, 1, 0, 1, 0, 1, 0, 1], 3) == 16)
        XCTAssert(solution.maxSatisfied([4, 10, 10], [1, 1, 0], 2) == 24)
        XCTAssert(solution.maxSatisfied([1], [0], 1) == 1)
        XCTAssert(solution.maxSatisfied([2, 6, 6, 9], [0, 0, 1, 1], 1) == 17)
    }
    
    func testNumMagicSquaresInside() {
        XCTAssert(solution.numMagicSquaresInside([[4,3,8,4],
                                                  [9,5,1,9],
                                                  [2,7,6,2]]) == 1)
    }
    
    func testTotalHammingDistance() {
        XCTAssert(solution.totalHammingDistance([4, 14, 2]) == 6)
    }
    
    func testRepeatedSubstringPattern() {
        XCTAssert(solution.repeatedSubstringPattern("abab"))
        XCTAssertFalse(solution.repeatedSubstringPattern("aba"))
        XCTAssert(solution.repeatedSubstringPattern("abcabcabcabc"))
        XCTAssertFalse(solution.repeatedSubstringPattern("abac"))
    }
    
    func testListInit() {
        let list = List([1, 2, 3, 4, 5, 6])
        XCTAssert(list.head != nil)
        var current = list.head, i = 1
        while current != nil {
            XCTAssert(current?.val == i)
            current = current?.next
            i += 1
        }
    }
    
    func testListThreshold() {
        let list = List([4, 5, 1, 2, 2, 1])
        _ = list.threshold(3)
        var current = list.head, array = [1, 2, 2, 1, 4, 5], i = 0
        while current != nil {
            XCTAssert(current?.val == array[i])
            current = current?.next
            i += 1
        }
    }
    
    func testListRotateRight() {
        let list = List([1, 2, 3, 4, 5, 6])
        _ = list.rotateRight(8)
        var current = list.head, array = [5, 6, 1, 2, 3, 4], i = 0
        while current != nil {
            XCTAssert(current?.val == array[i])
            current = current?.next
            i += 1
        }
    }
    
    func testTreeIsEqual() {
        let lhs = TreeNode.buildTree([1, 2, 3, nil, 4, 5, nil])
        let rhs = TreeNode.buildTree([1, 2, 3, nil, 4, 5, nil])
        XCTAssert(TreeNode.isEqual(lhs: lhs, rhs: rhs))
    }
    
    func testTreeSymmetric() {
        let tree = TreeNode.buildTree([1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 5])
        XCTAssert(tree!.symmetric)
    }
    
    func testTreeReversed() {
        let tree = TreeNode.buildTree([1, 2, 3, 4, 5])
        tree?.reversed()
        let reversed = TreeNode.buildTree([1, 3, 2, nil, nil, 5, 4])
        XCTAssert(TreeNode.isEqual(lhs: tree, rhs: reversed))
    }
    
    func testLevelTravel() {
        let array = [1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 5]
        XCTAssert(array == TreeNode.buildTree(array)?.levelTravel())
    }
    func testZLevelTravel() {
        let array = [1, 2, 3, 4, 5, 6, 7, 8]
        XCTAssert([1, 2, 3, 7, 6, 5, 4, 8] == TreeNode.buildTree(array)?.zLevelTravel())
    }
    
    func testAddStrings() {
        XCTAssert(solution.addStrings("41", "59") == "100")
    }
}
