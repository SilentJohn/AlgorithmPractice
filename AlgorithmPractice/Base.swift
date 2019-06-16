//
//  Base.swift
//  AlgorithmPractice
//
//  Created by john.jiang on 2019/4/12.
//  Copyright © 2019 john.jiang. All rights reserved.
//

import Foundation

/// 节点
public class Node<Element> {
    var value: Element
    weak var pre: Node?
    var next: Node?
    
    init(_ value: Element) {
        self.value = value
    }
}

public class LinkedList<Element>: ExpressibleByArrayLiteral {
    fileprivate var head: Node<Element>?
    fileprivate var tail: Node<Element>?
    fileprivate var countOfNodes = 0
    
    public required init(arrayLiteral elements: Element...) {
        for element in elements {
            let node = Node(element)
            guard head != nil else {
                head = Node(element)
                tail = self.head
                continue
            }
            node.pre = tail
            tail?.next = node
            tail = node
        }
        countOfNodes = elements.count
    }
    
    public init<S> (_ s: S) where S: Sequence, Element == S.Element {
        for element in s {
            let node = Node(element)
            guard head != nil else {
                head = Node(element)
                tail = self.head
                continue
            }
            node.pre = tail
            tail?.next = node
            tail = node
            countOfNodes += 1
        }
    }
}

// MARK: - 基本操作
extension LinkedList {
    func append(_ node: Node<Element>) {
        guard head != nil else {
            head = node
            tail = self.head
            return
        }
        node.pre = tail
        tail?.next = node
        tail = node
    }
    
    @discardableResult
    func remove(at index: Int) -> Bool {
        guard head != nil else {
            return false
        }
        // 分情况讨论
        //        if node === head {
        //            node.pre = nil
        //            head = node.next
        //        } else if node === tail {
        //            node.next = nil
        //            tail = node
        //        } else {
        //            node.pre?.next = node.next
        //            node.next?.pre = node.pre
        //        }
        // 统一处理，待测试
        let node = self[index]
        node.pre?.next = node.next
        node.next?.pre = node.pre
        return true
    }
}

// Sequence协议

//public struct NodeIterator<Element>: IteratorProtocol {
//    private var current: Node<Element>?
//
//    init(_ current: Node<Element>?) {
//        self.current = current
//    }
//
//    public mutating func next() -> Node<Element>? {
//        let next = current
//        current = current?.next
//        return next
//    }
//}

//extension LinkedList: Sequence {
//    public __consuming func makeIterator() -> NodeIterator<Element> {
//        return NodeIterator(self.head)
//    }
//}

extension LinkedList: Collection {
    public var count: Int {
        return countOfNodes
    }
    public var isEmpty: Bool {
        return countOfNodes == 0
    }
    
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        return countOfNodes
    }
    
    public func index(after i: Int) -> Int {
        return i + 1
    }
    
    public subscript(position: Int) -> Node<Element> {
        let direction = position < count / 2
        var current = direction ? head : tail, index = direction ? startIndex : endIndex
        while position != index {
            index += direction ? 1 : -1
            current = direction ? current?.next : current?.pre
        }
        return current!
    }
}

extension LinkedList: CustomStringConvertible where Element: CustomStringConvertible{
    public var description: String {
        return reduce("", { $0 + "->" + $1.value.description })
    }
}

/// 树的节点定义
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

/// 构造树
extension TreeNode {
    /// Build a tree from a level-traversal array
    ///
    /// - Parameters:
    ///   - values: A level-traversal array
    /// - Returns: The root of the result tree
    class func buildTree(_ values: [Int?]) -> TreeNode? {
        guard let rootValue = values[0] else {
            return nil
        }
        // current root
        let root = TreeNode(rootValue)
        var queue = [root], i = 1, isLeft = true
        while i < values.count, !queue.isEmpty {
            let parent = queue.first!
            let value = values[i], node = value == nil ? nil : TreeNode(value!)
            if isLeft {
                parent.left = node
            } else {
                parent.right = node
                queue.removeFirst()
            }
            if node != nil {
                queue.append(node!)
            }
            isLeft = !isLeft
            i += 1
        }
        
        return root
    }
}

extension TreeNode : CustomStringConvertible {
    // TODO: - description待完善
    public var description: String {
        return "value = \(val) " + "left = " + (left == nil ? "nil" : left!.description) + " right = " + (right == nil ? "nil" : right!.description)
    }
}
