import Foundation

// https://www.algoexpert.io/questions/River%20Sizes

class Program {
    func riverSizes(_ matrix: [[Int]]) -> [Int] {
        var sizes = [Int]()
        var visit: [[Bool]] = matrix.map { $0.map { $0 == 2 } }
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count {
                if visit[i][j] { continue }
                traverseNode(i, j, matrix, &visit, &sizes)
            }
        }
        return sizes
    }
    private func traverseNode(_ k: Int, _ l: Int, _ matrix: [[Int]], _ visited: inout [[Bool]], _ sizes: inout [Int]) {
        var i = k, j = l, current = 0
        var explore = [[i,j]] // nodes to explore
        while explore.count > 0 {
            guard let node = explore.popLast() else { return }
            i = node[0]
            j = node[1]
            if visited[i][j] { continue }
            visited[i][j] = true
            if matrix[i][j] == 0 { continue }
            current += 1
            let unvisited = getUnvisitedNeighbors(i, j, matrix, visited) // unvisited neighbors
            unvisited.map{ explore.append($0) }
        }
        if current > 0 { sizes.append(current) }
    }
    private func getUnvisitedNeighbors(_ i: Int, _ j: Int, _ matrix: [[Int]], _ visited: [[Bool]]) -> [[Int]] {
        var un = [[Int]]() // unvisited neighbors
        if i > 0, !visited[i-1][j] { un.append([i-1, j]) }
        if i < matrix.count - 1, !visited[i + 1][j] { un.append([i+1, j]) }
        if j > 0, !visited[i][j-1] { un.append([i, j-1]) }
        if j < matrix[i].count - 1, !visited[i][j+1] { un.append([i, j+1]) }
        return un
    }
}

import XCTest

// Executed 1 test, with 0 failures (0 unexpected) in 0.097 (0.099) seconds

class Tests: XCTestCase {
    private let p = Program()
    func test() {
        let matrix = [
            [1, 0, 0, 1, 0],
            [1, 0, 1, 0, 0],
            [0, 0, 1, 0, 1],
            [1, 0, 1, 0, 1],
            [1, 0, 1, 1, 0]
        ]
        let expected = [1, 2, 2, 2, 5]
        let riverSizes = p.riverSizes(matrix).sorted()
        XCTAssert(riverSizes == expected)
    }
}

Tests.defaultTestSuite.run()
