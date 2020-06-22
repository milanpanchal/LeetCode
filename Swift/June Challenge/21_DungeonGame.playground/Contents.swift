/*:
# Dungeon Game
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/541/week-3-june-15th-june-21st/3367/

 ---

### Problem Statement:

 The demons had captured the princess (P) and imprisoned her in the bottom-right corner of a dungeon. The dungeon consists of M x N rooms laid out in a 2D grid. Our valiant knight (K) was initially positioned in the top-left room and must fight his way through the dungeon to rescue the princess.

 The knight has an initial health point represented by a positive integer. If at any point his health point drops to 0 or below, he dies immediately.

 Some of the rooms are guarded by demons, so the knight loses health (negative integers) upon entering these rooms; other rooms are either empty (0's) or contain magic orbs that increase the knight's health (positive integers).

 In order to reach the princess as quickly as possible, the knight decides to move only rightward or downward in each step.

  

 Write a function to determine the knight's minimum initial health so that he is able to rescue the princess.

 For example, given the dungeon below, the initial health of the knight must be at least 7 if he follows the optimal path `RIGHT-> RIGHT -> DOWN -> DOWN.`


### Example:

 ```
 +-----+-----+-----+
 |-2(K)|  -3 |  3  |
 +-----|-----|-----+
 | -5  | -10 |  1  |
 +-----|-----|-----+
 | 10  |  30 |-5(P)|
 +-----+-----+-----+
 
 ```
 

 ### Notes:
 + The knight's health has no upper bound.
 + Any room can contain threats or power-ups, even the first room the knight enters and the bottom-right room where the princess is imprisoned.

 */

import UIKit

// 45 / 45 test cases passed.
// Status: Accepted
// Runtime: 48 ms
// Memory Usage: 21.2 MB

class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        
        guard dungeon.count > 0 else {
            return 1
        }
        
        let rows = dungeon.count
        let columns = dungeon[0].count
        
        var dp = Array(repeating: Array(repeating: 0, count: columns), count: rows)

        // Setup min value to enter before princess (P) Cell
        dp[rows-1][columns-1] = max(1 - dungeon[rows-1][columns-1], 1)
        
        // Setting last column value
        for i in stride(from: rows-2, through: 0, by: -1) {
            dp[i][columns-1] = max(dp[i+1][columns-1] - dungeon[i][columns-1], 1)
        }

        // Setting last rows value
        for j in stride(from: columns-2, through: 0, by: -1) {
            dp[rows-1][j] = max(dp[rows-1][j+1] - dungeon[rows-1][j], 1)
        }

        // Setting remaining cells
        for i in stride(from: rows-2, through: 0, by: -1) {
            for j in stride(from: columns-2, through: 0, by: -1) {
                dp[i][j] = max(min(dp[i+1][j],dp[i][j+1]) - dungeon[i][j], 1)
            }
        }
        
        return dp.first!.first!
    }
}

let obj = Solution()
obj.calculateMinimumHP([[-2,-3,3],[-5,-10,1],[10,30,-5]]) // 7
