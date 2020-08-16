/*:
# Best Time to Buy and Sell Stock III
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3426/

 ---

### Problem Statement:
 
 Say you have an array for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete at most two transactions.

 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).


### Example 1:

 ```
 Input: [3,3,5,0,0,3,1,4]
 Output: 6
 Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
              Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.

 ```

 ### Example 2:

 ```
 Input: [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
              Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
              engaging multiple transactions at the same time. You must sell before buying again.

 ```

 ### Example 3:

 ```
 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.

 ```
 */


import UIKit

// 200 / 200 test cases passed.
// Status: Accepted
// Runtime: 44 ms
// Memory Usage: 21.1 MB

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        var profits = [Int](repeating: 0, count: prices.count)
        var ma = prices.last ?? 0
        
        for i in stride(from: prices.count - 2, through: 0, by: -1) {
            profits[i] = max(profits[i + 1], ma - prices[i])
            ma = max(ma, prices[i])
        }
        
        var result = profits.first ?? 0
        var mi = Int.max
        
        for i in 0..<prices.count {
            result = max(result, prices[i] - mi + (i < prices.count - 1 ? profits[i + 1] : 0))
            mi = min(mi, prices[i])
        }
        return result
    }
}

class Solution1 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        
        var lProfit = prices.map { _ in 0 }
        var leftMin = prices[0]
        var lProfixMax = 0
        
        for i in 0..<prices.count {
            if prices[i] > leftMin {
                lProfixMax = max(lProfixMax, prices[i] - leftMin)
            } else {
                leftMin = prices[i]
            }
            lProfit[i] = lProfixMax
        }
        
        var rightMax = prices[prices.count-1]
        var rProfit = prices.map { _ in 0 }
        var rProfitMax = 0
        
        for i in (0..<prices.count).reversed() {
            if rightMax > prices[i] {
                rProfitMax = max(rProfitMax, rightMax - prices[i])
            } else {
                rightMax = prices[i]
            }
            rProfit[i] = rProfitMax
        }
        

        var result = lProfit.max()! // one transaction
        for i in 0..<prices.count {
            let left = lProfit[i]
            let right = (i + 1 < prices.count) ? rProfit[i+1] : 0
            result = max(result, left + right) // two transactions
        }
        
        return result
    }
}

let sol = Solution()
sol.maxProfit([3,3,5,0,0,3,1,4])    // 6
sol.maxProfit([1,2,3,4,5])          // 4
sol.maxProfit([7,6,4,3,1])          // 0

let sol1 = Solution1()
sol1.maxProfit([3,3,5,0,0,3,1,4])    // 6
sol1.maxProfit([1,2,3,4,5])          // 4
sol1.maxProfit([7,6,4,3,1])          // 0
