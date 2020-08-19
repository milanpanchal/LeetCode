/*:
# Numbers With Same Consecutive Differences
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3428/

 ---

### Problem Statement:

 Return all non-negative integers of length `N` such that the absolute difference between every two consecutive digits is `K`.

 Note that every number in the answer must not have leading zeros except for the number `0` itself. For example, `01` has one leading zero and is invalid, but `0` is valid.

 You may return the answer in any order.


### Example:

 ```
 Input: N = 3, K = 7
 Output: [181,292,707,818,929]
 Explanation: Note that 070 is not a valid number, because it has leading zeroes.

 Input: N = 2, K = 1
 Output: [10,12,21,23,32,34,43,45,54,56,65,67,76,78,87,89,98]

 ```
 
 ### Constraints:
 + 1 <= N <= 9
 + 0 <= K <= 9
 
 */


import UIKit

// 92 / 92 test cases passed.
// Status: Accepted
// Runtime: 16 ms
// Memory Usage: 21.4 MB

class Solution {
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
        guard N > 1 else {
            return Array(0...9)
        }
        
        var result = [Int]()
        
        for i in 1...9 {
            
            var numbers = [i]
            
            for _ in 1..<N {
                
                var tempArray = [Int]()
                
                for num in numbers {
                    
                    let modeBy10 = num%10
                    
                    if modeBy10 + K < 10 {
                        tempArray.append(num*10 + modeBy10 + K)
                    }
                    
                    if modeBy10 - abs(modeBy10 - K) == K, K != 0 {
                        tempArray.append(num*10 + abs(modeBy10 - K))
                    }
                }
                
                numbers = tempArray
            }
            result += numbers
        }
        
        return result
        
    }
}

let sol = Solution()
sol.numsSameConsecDiff(1, 7) // [0,1,2,3,4,5,6,7,8,9]
sol.numsSameConsecDiff(3, 7) // [181,292,707,818,929]
sol.numsSameConsecDiff(2, 1) // [10,12,21,23,32,34,43,45,54,56,65,67,76,78,87,89,98]

