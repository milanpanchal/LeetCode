/*:
# 62. Unique Paths
  https://leetcode.com/problems/unique-paths

 ---

### Problem Statement:

 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 How many possible unique paths are there?

 +-----+-----+-----+-----+-----+-----+-----+
 |   S  |        |       |       |       |       |        |
 +-----+-----+-----+-----+-----+-----+-----+
 |        |        |       |       |       |       |       |
 +-----+-----+-----+-----+-----+-----+-----+
 |        |        |       |       |       |       |   F  |
 +-----+-----+-----+-----+-----+-----+-----+
 
 Above is a 7 x 3 grid. How many possible unique paths are there?



### Example:

 ```
 Input: m = 3, n = 2
 Output: 3

 Explanation:
 From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 1. Right -> Right -> Down
 2. Right -> Down -> Right
 3. Down -> Right -> Right

 Input: m = 7, n = 3
 Output: 28
 ```
 
 ### Constraints:
 + 1 <= m, n <= 100
 + It's guaranteed that the answer will be less than or equal to 2 * 10 ^ 9.

 */

import UIKit

class Solution {
    
    // 62 / 62 test cases passed.
    // Status: Accepted
    // Runtime: 12 ms
    // Memory Usage: 20.4 MB
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0, n > 0 else {
            return 0
        }
        var paths = [Int](repeating: 0, count: n)
        paths[0] = 1
        
        for _ in 0..<m {
            for j in 1..<n {
                paths[j] += paths[j-1]
            }
        }
        // print(paths)
        return paths[n-1]
    }
    
    //    62 / 62 test cases passed.
    //    Status: Accepted
    //    Runtime: 8 ms
    //    Memory Usage: 20.5 MB

    func uniquePaths2(_ m: Int, _ n: Int) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        
        for rowIndex in 0..<m {
            for columnIndex in 0..<n {
                if rowIndex == 0 || columnIndex == 0 {
                    dp[rowIndex][columnIndex] = 1
                } else {
                    dp[rowIndex][columnIndex] = dp[rowIndex - 1][columnIndex] + dp[rowIndex][columnIndex - 1]
                }
            }
        }
        // print(dp)
        return dp.last?.last ?? 0
    }

}

let sol = Solution()
sol.uniquePaths(3, 2) // 3
sol.uniquePaths2(7, 3) // 28

