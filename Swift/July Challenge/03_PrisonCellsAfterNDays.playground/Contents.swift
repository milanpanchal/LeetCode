/*:
# Prison Cells After N Days
  https://leetcode.com/explore/featured/card/july-leetcoding-challenge/544/week-1-july-1st-july-7th/3379/

 ---

### Problem Statement:
 
 There are 8 prison cells in a row, and each cell is either occupied or vacant.

 Each day, whether the cell is occupied or vacant changes according to the following rules:

 + If a cell has two adjacent neighbors that are both occupied or both vacant, then the cell becomes occupied.
 + Otherwise, it becomes vacant.
 (Note that because the prison is a row, the first and the last cells in the row can't have two adjacent neighbors.)

 We describe the current state of the prison in the following way: cells[i] == 1 if the i-th cell is occupied, else cells[i] == 0.

 Given the initial state of the prison, return the state of the prison after N days (and N such changes described above.)

### Example 1:

 ```
 Input: cells = [0,1,0,1,1,0,0,1], N = 7
 Output: [0,0,1,1,0,0,0,0]
 
 Explanation:
 The following table summarizes the state of the prison on each day:
 Day 0: [0, 1, 0, 1, 1, 0, 0, 1]
 Day 1: [0, 1, 1, 0, 0, 0, 0, 0]
 Day 2: [0, 0, 0, 0, 1, 1, 1, 0]
 Day 3: [0, 1, 1, 0, 0, 1, 0, 0]
 Day 4: [0, 0, 0, 0, 0, 1, 0, 0]
 Day 5: [0, 1, 1, 1, 0, 1, 0, 0]
 Day 6: [0, 0, 1, 0, 1, 1, 0, 0]
 Day 7: [0, 0, 1, 1, 0, 0, 0, 0]
 ```
 
 ### Example 2:
 ```
 Input: cells = [1,0,0,1,0,0,1,0], N = 1000000000
 Output: [0,0,1,1,1,1,1,0]
 
 ```
 
 ### Notes:
 + cells.length == 8
 + cells[i] is in {0, 1}
 + 1 <= N <= 10^9

 */


import UIKit

// 0: Current Vacant
// 1: Current Occupied
// 2: To be vacant
// 3: To be occupied

class Solution {
    
    //    258 / 258 test cases passed.
    //    Status: Accepted
    //    Runtime: 16 ms
    //    Memory Usage: 21.1 MB
    
    func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
        
        guard cells.count > 2 else { return cells }

        var cells = cells
        let cellCount = cells.count
        let N = N % 14 == 0 ? 14 : N % 14

        for _ in 0..<N {
            
            cells[0] = cells[0] == 1 ? 2 : 0
            
            for i in 1..<cellCount-1 {
                if (cells[i-1] == 1 && cells[i+1] == 1) ||
                    (cells[i-1] == 0 && cells[i+1] == 0) ||
                    (cells[i-1] == 3 && cells[i+1] == 0) ||
                    (cells[i-1] == 2 && cells[i+1] == 1) {
                    cells[i] = cells[i] == 1 ? 1 : 3
                } else {
                    cells[i] = cells[i] == 0 ? 0 : 2
                }
            }
            
            cells[cellCount-1] = cells[cellCount-1] == 1 ? 2 : 0
            
            for i in 1..<cellCount-1 {
                if cells[i] == 2 {
                    cells[i] = 0
                } else if cells[i] == 3 {
                    cells[i] = 1
                }
            }
            
            // print(cells)
        }
        return cells
    }
}

let sol = Solution()
sol.prisonAfterNDays([0,1,0,1,1,0,0,1], 7) // [0,0,1,1,0,0,0,0]
sol.prisonAfterNDays([1,0,0,1,0,0,1,0], 1000000000) // [0,0,1,1,1,1,1,0]



// Using extra array
class Solution1 {
    func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
        guard cells.count > 2 else { return cells }
        var result = cells
        let optimizedN = (N - 1) % 14 + 1
        for day in 0..<optimizedN {

                var newState = result
                newState[0] = 0
                newState[7] = 0
                for index in 1...result.count - 2 {
                    if result[index - 1] == result[index + 1] {
                        newState[index] = 1
                    } else {
                        newState[index] = 0
                    }
                }
                result = newState
            
        }
        
        return result
    }
}
