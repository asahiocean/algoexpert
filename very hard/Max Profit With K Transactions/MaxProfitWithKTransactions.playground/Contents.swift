import Foundation

// Max Profit With K Transactions
// https://www.algoexpert.io/questions/Max%20Profit%20With%20K%20Transactions

class Program {
    func maxProfitWithKTransactions(_ prices: [Int], _ k: Int) -> Int {
        guard prices.count > 0 else { return 0 }
        var profits = [[Int]]()
        for _ in stride(from: 0, through: k, by: 1) {
            let row = Array(repeating: 0, count: prices.count)
            profits.append(row)
        }
        for t in stride(from: 1, through: k, by: 1) {
            var profit = Int.min
            for d in stride(from: 1, to: prices.count, by: 1) {
                profit = max(profit, profits[t-1][d-1] - prices[d-1])
                profits[t][d] = max(profits[t][d - 1], profit + prices[d])
            }
        }
        return profits[k][prices.count - 1]
    }
}

// MARK: - Test cases -

// Result: Executed 1 test, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let program = Program()
    
    func test() {
        XCTAssertEqual(program.maxProfitWithKTransactions([5, 11, 3, 50, 60, 90], 2), 93)
    }
}

Tests.defaultTestSuite.run()
