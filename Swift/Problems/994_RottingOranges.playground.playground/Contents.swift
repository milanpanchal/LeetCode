/*:
# 994. Rotting Oranges [Medium]
  https://leetcode.com/problems/rotting-oranges

 ---

### Problem Statement:

 In a given grid, each cell can have one of three values:

 + the value `0` representing an empty cell;
 + the value `1` representing a fresh orange;
 + the value `2` representing a rotten orange.
 Every minute, any fresh orange that is adjacent (4-directionally) to a rotten orange becomes rotten.

 Return the minimum number of minutes that must elapse until no cell has a fresh orange.  If this is impossible, return `-1` instead.


### Example:

 ```
 Input: [[2,1,1],[1,1,0],[0,1,1]]
 Output: 4

 Input: [[2,1,1],[0,1,1],[1,0,1]]
 Output: -1
 Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.

 
 Input: [[0,2]]
 Output: 0
 Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.

 ```
 
 ### Notes:
 + 1 <= grid.length <= 10
 + 1 <= grid[0].length <= 10
 + grid[i][j] is only 0, 1, or 2.

 
 */


import UIKit

// 303 / 303 test cases passed.
// Status: Accepted
// Runtime: 24 ms
// Memory Usage: 21.2 MB

class Solution {
    let rowDir = [0, 0, 1, -1]
    let colDir = [1, -1, 0, 0]

    func orangesRotting(_ grid: [[Int]]) -> Int {
        
        // Edge Cases
        if grid.isEmpty {
            return -1
        }
        

        let rowCount = grid.count
        let columnCount = grid[0].count
        
        var freshOrangeCount = 0
        var numOfMin = 0
        
        // queue for rotten oranges
        var rottenOrangesQueue = [(row: Int, col: Int, minute: Int)]()
        
        for row in 0..<rowCount {
            for col in 0..<columnCount {
                if grid[row][col] == 1 {
                    freshOrangeCount += 1
                } else if grid[row][col] == 2 {
                    rottenOrangesQueue.append((row, col, numOfMin))
                }
            }
        }
        
        // No fresh orange found
        if freshOrangeCount == 0 {
            return 0
        }
        
        var grid = grid
        while !rottenOrangesQueue.isEmpty {
            
            let item = rottenOrangesQueue.removeFirst()
            numOfMin = item.minute
            
            for j in 0..<4 {
                let newRow = item.row + rowDir[j]
                let newCol = item.col + colDir[j]
                
                // Mark adjacent fresh oranges as rotten oranges
                if newRow >= 0 && newRow<rowCount &&
                    newCol >= 0 && newCol<columnCount &&
                    grid[newRow][newCol] == 1 {
                    
                    grid[newRow][newCol] = 2
                    freshOrangeCount -= 1
                    rottenOrangesQueue.append((newRow, newCol, numOfMin + 1))
                }
            }
        }
        
        return freshOrangeCount == 0 ? numOfMin : -1
    }
}

let sol = Solution()
sol.orangesRotting([[2,1,1],[1,1,0],[0,1,1]]) // 4
sol.orangesRotting([[2,1,1],[0,1,1],[1,0,1]]) // -1
sol.orangesRotting([[0,2]]) // 0

