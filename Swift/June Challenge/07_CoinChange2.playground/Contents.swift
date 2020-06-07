/*:
#   Coin Change 2

 https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3353/

 ---

### Problem Statement:

 You are given coins of different denominations and a total amount of money. Write a function to compute the number of combinations that make up that amount. You may assume that you have infinite number of each kind of coin.


### Example 1:

 ```
 Input: amount = 5, coins = [1, 2, 5]
 Output: 4
 Explanation: there are four ways to make up the amount:
 5=5
 5=2+2+1
 5=2+1+1+1
 5=1+1+1+1+1
 ```
 
 ### Example 2:

 ```
 Input: amount = 3, coins = [2]
 Output: 0
 Explanation: the amount of 3 cannot be made up just with coins of 2.
 ```
 ### Example 3:

 ```
 Input: amount = 10, coins = [10]
 Output: 1
 ```

 ### Notes:
 You can assume that


 + 0 <= amount <= 5000
 + 1 <= coin <= 5000
 + the number of coins is less than 500
 + the answer is guaranteed to fit into signed 32-bit integer

 
 */

import UIKit

func change(_ amount: Int, _ coins: [Int]) -> Int {
 
    if amount == 0 { return 1 }
    if coins.count == 0 { return 0 }
    
    var dp = Array(repeating: 0, count: amount+1)
    dp[0] = 1


    for eachCoin in coins {
        guard amount >= eachCoin else {
            continue
        }
        
        for i in eachCoin...amount {
            dp[i] += dp[i-eachCoin]
        }
        
    }
    return dp.last!
}
change(0, []) // 1
change(3, [2]) // 0
change(10, [10]) // 1
change(10, [5]) // 1
change(5, [1, 2, 5]) // 4
