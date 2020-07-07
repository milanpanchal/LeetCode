/*:
# 463. Island Perimeter
  https://leetcode.com/problems/island-perimeter/

 ---

### Problem Statement:

 You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water.

 Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).

 The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.


### Example:

 ```
 Input:
 [[0,1,0,0],
  [1,1,1,0],
  [0,1,0,0],
  [1,1,0,0]]

 Output: 16

 Explanation: The perimeter is the 16 yellow stripes in the image below:

 ```https://assets.leetcode.com/uploads/2018/10/12/island.png
  
 */

import UIKit

class Solution {
    
    //    5833 / 5833 test cases passed.
    //    Status: Accepted
    //    Runtime: 616 ms
    //    Memory Usage: 20.9 MB
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }
        
        let rows = grid.count
        let columns = grid[0].count
        var perimeter = 0
        
        for row in 0..<rows {
            for col in 0..<columns {
                
                if grid[row][col] == 1 {
                    
                    perimeter += 4
                    
                    if row > 0 && grid[row-1][col] == 1 {
                        perimeter -= 2
                    }
                    
                    if col > 0 && grid[row][col-1] == 1 {
                        perimeter -= 2
                    }
                    
                }
            }
        }
        return perimeter
    }
}

let sol = Solution()
sol.islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]) // 16
