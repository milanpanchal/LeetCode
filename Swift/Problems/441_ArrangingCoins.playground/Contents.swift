/*:
# Arranging Coins
  https://leetcode.com/problems/arranging-coins/
 
 ---

### Problem Statement:
 You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.

 Given n, find the total number of full staircase rows that can be formed.

 n is a non-negative integer and fits within the range of a 32-bit signed integer.

### Example 1:

 ```
 n = 5

 The coins can form the following rows:
 ¤
 ¤ ¤
 ¤ ¤

 Because the 3rd row is incomplete, we return 2.
 
 ```
 
 ### Example 2:
 ```
 n = 8

 The coins can form the following rows:
 ¤
 ¤ ¤
 ¤ ¤ ¤
 ¤ ¤

 Because the 4th row is incomplete, we return 3.

 ```
 */

import UIKit

class Solution {
    
//    Brute force solution
//    1336 / 1336 test cases passed.
//    Status: Accepted
//    Runtime: 40 ms
//    Memory Usage: 20.5 MB

    func arrangeCoinsBruteForce(_ n: Int) -> Int {
        
        var count = 0
        var increment = 1
        var n = n
        while n >= 0 {
            n = n-increment
            count += 1
            increment += 1
        }
        
        return count - 1
    }
    
    // 1336 / 1336 test cases passed.
    // Status: Accepted
    // Runtime: 8 ms
    // Memory Usage: 20.4 MB
    
    // Time complexity: O(logN)
    // Space complexity:  O(1)
    
    func arrangeCoins(_ n: Int) -> Int {
        var left = 0
        var right = n
        var mid:Int
        var curr:Int
        
        while left <= right {
            
            mid = (left + right) / 2
            curr = mid * (mid + 1) / 2
            
            if curr == n { return mid }
            
            if (n < curr) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return right
    }
    
    // Time complexity: O(1)
    // Space complexity:  O(1)

    func arrangeCoins2(_ n: Int) -> Int {
        return Int(sqrt(2 * Double(n) + 0.25) - 0.5)
    }
}

let sol = Solution()
sol.arrangeCoins2(5) // 2
sol.arrangeCoins2(8) // 3
sol.arrangeCoins2(10) // 4

