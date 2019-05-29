//
//  MyQueue.swift
//  AlgorithmPractice
//
//  Created by Chloe on 2019/5/29.
//  Copyright © 2019 john.jiang. All rights reserved.
//

import Foundation

/**
 Implement the following operations of a queue using stacks.
 
 push(x) -- Push element x to the back of queue.
 pop() -- Removes the element from in front of queue.
 peek() -- Get the front element.
 empty() -- Return whether the queue is empty.
 Example:
 
 MyQueue queue = new MyQueue();
 
 queue.push(1);
 queue.push(2);
 queue.peek();  // returns 1
 queue.pop();   // returns 1
 queue.empty(); // returns false
 Notes:
 
 You must use only standard operations of a stack -- which means only push to top, peek/pop from top, size, and is empty operations are valid.
 Depending on your language, stack may not be supported natively. You may simulate a stack by using a list or deque (double-ended queue), as long as you use only standard operations of a stack.
 You may assume that all operations are valid (for example, no pop or peek operations will be called on an empty queue).
 */
class MyQueue {
    
    private var stack1: [Int] = []
    private var stack2: [Int] = []
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        while !stack2.isEmpty {
            stack1.append(stack2.removeLast())
        }
        stack1.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        while !stack1.isEmpty {
            stack2.append(stack1.removeLast())
        }
        return stack2.removeLast()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        while !stack1.isEmpty {
            stack2.append(stack1.removeLast())
        }
        return stack2.last!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
    }
}
