/*:
# Pascal's Triangle II
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3421/

 ---

### Problem Statement:

 Given a non-negative index k where `k ≤ 33`, return the `kth` index row of the Pascal's triangle.

 Note that the row index starts from 0.

 In Pascal's triangle, each number is the sum of the two numbers directly above it.


### Example:

 ```
 Input: 3
 Output: [1,3,3,1]
 ```
 
 ### Follow up:
 + Could you optimize your algorithm to use only O(k) extra space?
 
 */


import UIKit

class Solution {
    
    //    34 / 34 test cases passed.
    //    Status: Accepted
    //    Runtime: 8 ms
    //    Memory Usage: 21 MB
    
    func getRow(_ rowIndex: Int) -> [Int] {
        
        if rowIndex <= 1 {
            return Array(repeating: 1, count: rowIndex + 1)
        }
        
        var result: [Int] = [1, 1]
        
        for _ in 2...rowIndex {
            var nextRow = [Int]()
            nextRow.append(1)

            for i in 0..<result.count - 1 {
                let val = result[i] + result[i + 1]
                nextRow.append(val)
            }
            
            nextRow.append(1)
            result = nextRow
        }
        
        return result
    }
}

let sol = Solution()
sol.getRow(0) // [1]
sol.getRow(1) // [1,1]
sol.getRow(2) // [1,2,1]
sol.getRow(3) // [1,3,3,1]
sol.getRow(4) // [1,4,6,4,1]
sol.getRow(5) // [1,5,10,10,5,1]
