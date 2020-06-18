/*:
# Surrounded Regions
  https://leetcode.com/explore/featured/card/june-leetcoding-challenge/541/week-3-june-15th-june-21st/3363/

 ---

### Problem Statement:

 Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.

 A region is captured by flipping all 'O's into 'X's in that surrounded region.

### Example:

 ```
 X X X X
 X O O X
 X X O X
 X O X X

 After running your function, the board should be:

 X X X X
 X X X X
 X X X X
 X O X X

 ```
 
 ### Explanation:
 
 Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.


 
 */
import UIKit

class Solution {
    let boundryChar: Character = "O"
    let specialChar: Character = "#"
    
    func solve(_ board: inout [[Character]]) {
        
        // Checking best case
        if board.count == 0 || board[0].count == 0 { return }
        
        let totalRow  = board.count
        let totalColumn = board[0].count
        
        // Checking Rows
        for row in 0..<totalRow {
            if board[row][0] == boundryChar { findBoundray(&board, row: row, column: 0)}
            if board[row][totalColumn-1] == boundryChar { findBoundray(&board, row: row, column: totalColumn-1)}
        }
        
        // Checking Columns
        for column in 0..<totalColumn {
            if board[0][column] == boundryChar { findBoundray(&board, row: 0, column: column)}
            if board[totalRow-1][column] == boundryChar { findBoundray(&board, row: totalRow-1, column: column)}
        }
        print("board: \(board)")
        
        // Replacing Values
        for row in 0..<totalRow {
            for column in 0..<totalColumn {
                if board[row][column] == specialChar {
                    board[row][column] = boundryChar
                } else if board[row][column] == boundryChar {
                    board[row][column] = "X"
                }
            }
        }
        
    }
    
    private func findBoundray(_ board: inout [[Character]], row: Int, column: Int) {
        if row < 0 || column < 0 || row > board.count - 1 || column > board[0].count - 1 {
            return
        }
        
        if board[row][column] == boundryChar {
            board[row][column] = specialChar
        }
        
        if row > 0, board[row - 1][column] == boundryChar {
            findBoundray(&board, row: row - 1, column: column)
        }
        
        if row < board.count - 1, board[row + 1][column] == boundryChar {
            findBoundray(&board, row: row + 1, column: column)
        }
        
        if column > 0, board[row][column-1] == boundryChar {
            findBoundray(&board, row: row, column: column-1)
        }
        
        if column < board[0].count - 1, board[row][column+1] == boundryChar {
            findBoundray(&board, row: row, column: column+1)
        }
        
    }
    
}


var board:[[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]

let obj = Solution()
obj.solve(&board)
print("Ans: ", board)

//var board2:[[Character]] = [["X","O","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
//obj.solve(&board2)
//
//var board3:[[Character]] = [["O"]]
//obj.solve(&board3)
//print(board3)
