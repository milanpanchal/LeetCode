/*:
# 983. Minimum Cost For Tickets [Medium]
 https://leetcode.com/problems/minimum-cost-for-tickets/
 
 ---

### Problem Statement:
 
 In a country popular for train travel, you have planned some train travelling one year in advance.  The days of the year that you will travel is given as an array `days`.  Each day is an integer from `1` to `365`.

 Train tickets are sold in 3 different ways:

 + a 1-day pass is sold for `costs[0]` dollars;
 + a 7-day pass is sold for `costs[1]` dollars;
 + a 30-day pass is sold for `costs[2]` dollars.
 
 The passes allow that many days of consecutive travel.  For example, if we get a 7-day pass on day 2, then we can travel for 7 days: day 2, 3, 4, 5, 6, 7, and 8.

 Return the minimum number of dollars you need to travel every day in the given list of `days`.

### Example 1:

 ```
 Input: days = [1,4,6,7,8,20], costs = [2,7,15]
 Output: 11
 Explanation:
 For example, here is one way to buy passes that lets you travel your travel plan:
 On day 1, you bought a 1-day pass for costs[0] = $2, which covered day 1.
 On day 3, you bought a 7-day pass for costs[1] = $7, which covered days 3, 4, ..., 9.
 On day 20, you bought a 1-day pass for costs[0] = $2, which covered day 20.
 In total you spent $11 and covered all the days of your travel.

 ```

 ### Example 2:

 ```
 Input: days = [1,2,3,4,5,6,7,8,9,10,30,31], costs = [2,7,15]
 Output: 17
 Explanation:
 For example, here is one way to buy passes that lets you travel your travel plan:
 On day 1, you bought a 30-day pass for costs[2] = $15 which covered days 1, 2, ..., 30.
 On day 31, you bought a 1-day pass for costs[0] = $2 which covered day 31.
 In total you spent $17 and covered all the days of your travel.

 ```

 ### Notes:
 + 1 <= days.length <= 365
 + 1 <= days[i] <= 365
 + days is in strictly increasing order.
 + costs.length == 3
 + 1 <= costs[i] <= 1000
 
 */


import UIKit

class Solution {
    
//    66 / 66 test cases passed.
//    Status: Accepted
//    Runtime: 104 ms
//    Memory Usage: 20.9 MB

    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        
        guard days.count > 0, costs.count > 0 else {
            return 0
        }
        
        var dp = Array(repeating: 0, count: days.last! + 1)
        
        for i in 1..<dp.count {
            if days.contains(i) {

                let option1 = dp[i - 1] + costs[0]          // daily
                let option2 = dp[max(i - 7, 0)] + costs[1]  // weekly
                let option3 = dp[max(i - 30, 0)] + costs[2] // monthly
                
                dp[i] = min(option1, option2, option3)

            } else {
                dp[i] = dp[i - 1]
            }
            
        }
        
        return dp.last!
    }

    // Leetcode Solution
    func mincostTickets2(_ days: [Int], _ costs: [Int]) -> Int {
        var dp = Array(repeating:Int.max, count: days.count)
        dp[0] = costs.min()!
        let costs = zip([1, 7, 30], costs)
        for (i, day) in days.enumerated().dropFirst() {
            for (duration, cost) in costs {
                var j = i
                while j >= 0 && (day-days[j]) < duration {
                    j -= 1
                }
                dp[i] = min(dp[i], (j >= 0 ? dp[j] : 0) + cost)
            }
        }
        
        return dp.last ?? 0
    }
}

let sol = Solution()
sol.mincostTickets([1,2,3,4,5,6,7,8,9,10,30,31], [2,7,15]) // 17
sol.mincostTickets2([1,2,3,4,5,6,7,8,9,10,30,31], [2,7,15]) // 17

