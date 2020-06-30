/*:
# Unique Paths
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/543/week-5-june-29th-june-30th/3375/

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
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        return 1
    }
}

let sol = Solution()
sol.uniquePaths(3, 2) // 3
sol.uniquePaths(7, 3) // 28
