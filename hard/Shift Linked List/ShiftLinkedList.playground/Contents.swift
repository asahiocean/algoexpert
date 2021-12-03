import Foundation

// Shift Linked List
// https://www.algoexpert.io/questions/Shift%20Linked%20List

class Program {
    class LinkedList {
        var value: Int
        var next: LinkedList?
        
        init(value: Int) {
            self.value = value
            next = nil
        }
    }
    
    // O(n) time | O(1) space - where n is the number of nodes in the Linked List
    
    static func shiftLinkedList(_ head: LinkedList, _ k: Int) -> LinkedList? {
        var length = 1, tail = head
        
        while let next = tail.next {
            tail = next
            length += 1
        }
        
        let offset = abs(k) % length
        guard offset != 0 else { return head }
        
        var newPosition = length - offset
        if k <= 0 { newPosition = offset }
        
        var newTail = head
        for _ in 1 ..< newPosition where newTail.next != nil {
            newTail = newTail.next!
        }
        let newHead = newTail.next
        newTail.next = nil
        tail.next = head
        return newHead
    }
}

// MARK: - Test cases -

// Result: Executed 1 test, with 0 failures (0 unexpected) in 0.024 (0.025) seconds


import XCTest

class Tests: XCTestCase {
    
    func linkedListToArray(_ head: Program.LinkedList?) -> [Int] {
        var array = [Int]()
        var current = head
        while let c = current {
            array.append(c.value)
            current = c.next
        }
        return array
    }
    func test() {
        let head = Program.LinkedList(value: 0)
        head.next = Program.LinkedList(value: 1)
        head.next!.next = Program.LinkedList(value: 2)
        head.next!.next!.next = Program.LinkedList(value: 3)
        head.next!.next!.next!.next = Program.LinkedList(value: 4)
        head.next!.next!.next!.next!.next = Program.LinkedList(value: 5)
        let result = Program.shiftLinkedList(head, 2)
        let array = linkedListToArray(result)
        
        let expected = [4, 5, 0, 1, 2, 3]
        XCTAssertEqual(expected, array)
    }
}

Tests.defaultTestSuite.run()
