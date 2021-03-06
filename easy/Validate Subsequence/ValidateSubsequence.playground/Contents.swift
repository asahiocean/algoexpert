import Foundation

// Validate Subsequence
// https://www.algoexpert.io/questions/Validate%20Subsequence

// MARK: - Solution 1 -

class Program {
    static func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {
        var j = 0
        for i in array.indices {
            j = array[i] == sequence[j] ? j + 1 : j
            if j == sequence.count { return true }
        }
        return false
    }
}

// MARK: - Solution 2 -

class Program2 {
    static func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {
        var i = 0, n = 0
        while n < array.endIndex, i < sequence.endIndex {
            if array[n] == sequence[i] { i += 1 }
            n += 1
        }
        return i == sequence.endIndex
    }
}

// MARK: - Solution 3 -

class Program3 {
    static func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {
        var arrIdx = 0, seqIdx = 0
        while arrIdx < array.count, seqIdx < sequence.count {
            if array[arrIdx] == sequence[seqIdx] {
                seqIdx += 1
            }
            arrIdx += 1
        }
        return seqIdx == sequence.count
    }
}

// MARK: - Test Cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.089) seconds

import XCTest

class Tests: XCTestCase {
    
    let array = [5, 1, 22, 25, 6, -1, 8, 10]
    let sequence = [1, 6, -1, 10]
    
    func test0() {
        XCTAssert(Program.isValidSubsequence(array, sequence))
    }
    
    func test1() {
        XCTAssert(Program2.isValidSubsequence(array, sequence))
    }
    
    func test2() {
        XCTAssert(Program3.isValidSubsequence(array, sequence))
    }
}

Tests.defaultTestSuite.run()
