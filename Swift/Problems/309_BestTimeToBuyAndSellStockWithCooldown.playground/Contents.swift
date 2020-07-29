/*:
 # 309. Best Time to Buy and Sell Stock with Cooldown [Medium]
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
 
 ---
 
 ### Problem Statement:
 
 Say you have an array for which the i`th` element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times) with the following restrictions:
 
 + You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 + After you sell your stock, you cannot buy stock on next day. (ie, cooldown 1 day)
 
 ### Example:
 
 ```
 Input: [1,2,3,0,2]
 Output: 3
 Explanation: transactions = [buy, sell, cooldown, buy, sell]
 
 ```
 
 */


import UIKit

class Solution {
    
    //    211 / 211 test cases passed.
    //    Status: Accepted
    //    Runtime: 20 ms
    //    Memory Usage: 20.7 MB
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        // cannot sell with only 1 day
        if prices.count <= 1 {
            return 0
        }
        
        // either buy at 0 and sell at 1, or don't, whichever is more profitable
        if prices.count == 2 {
            return max(0, prices[1] - prices[0])
        }
        
        var maxProfitWithBuy    = Array(repeating: Int.min, count: prices.count)
        var maxProfitWithSell   = Array(repeating: Int.min, count: prices.count)
        
        maxProfitWithBuy[0] = -prices[0]
        maxProfitWithBuy[1] = -min(prices[0], prices[1])
        maxProfitWithSell[0] = 0
        maxProfitWithSell[1] = max(maxProfitWithSell[0], prices[1] - prices[0])
        
        for day in 2..<prices.count {
            maxProfitWithSell[day]  = max(maxProfitWithSell[day - 1], prices[day] + maxProfitWithBuy[day - 1])
            maxProfitWithBuy[day]   = max(maxProfitWithBuy[day - 1], maxProfitWithSell[day - 2] - prices[day])
            
        }
        
        return maxProfitWithSell.last!
    }
    
    //    211 / 211 test cases passed.
    //    Status: Accepted
    //    Runtime: 12 ms
    //    Memory Usage: 21.1 MB
    
    func maxProfit1(_ prices: [Int]) -> Int {
        
        // cannot sell with only 1 day
        if prices.count <= 1 {
            return 0
        }
        
        // either buy at 0 and sell at 1, or don't, whichever is more profitable
        if prices.count == 2 {
            return max(0, prices[1] - prices[0])
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: 2), count: prices.count)
        dp[0][0] = 0
        dp[0][1] = -prices[0]
        dp[1][0] = max(dp[0][0], dp[0][1] + prices[1])
        dp[1][1] = max(dp[0][1], dp[0][0] - prices[1])
        
        for i in 2..<prices.count {
            dp[i][0]  = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp[i][1]  = max(dp[i - 1][1], dp[i - 2][0] - prices[i])
            
        }
        
        return dp.last?.first ?? 0
    }
    
    func maxProfit2(_ prices: [Int]) -> Int {
        var sold = 0
        var hold = Int.min
        var rest = 0
        
        for price in prices {
            let prevSold = sold
            sold = hold + price
            hold = max(hold, rest - price)
            rest = max(rest, prevSold)
        }
        
        return max(rest, sold)
    }
}

let sol = Solution()
sol.maxProfit([1,2,3,0,2]) // 3
sol.maxProfit1([1,2,3,0,2]) // 3
sol.maxProfit2([1,2,3,0,2]) // 3
