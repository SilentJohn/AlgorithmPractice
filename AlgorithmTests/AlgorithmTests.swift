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
    
    var linkedList: LinkedList<Int>?
    
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
}
