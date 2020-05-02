/*:
 # 289. Game of Life
 https://leetcode.com/problems/game-of-life/
 ___
 
 According to the Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."

 Given a board with m by n cells, each cell has an initial state live (1) or dead (0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):

 + Any live cell with fewer than two live neighbors dies, as if caused by under-population.
 + Any live cell with two or three live neighbors lives on to the next generation.
 + Any live cell with more than three live neighbors dies, as if by over-population..
 + Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

 Write a function to compute the next state (after one update) of the board given its current state. The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously.


 ### Input:
 ```
 [
   [0,1,0],
   [0,0,1],
   [1,1,1],
   [0,0,0]
 ]
 ```
 ### Output:
 ```
 [
   [0,0,0],
   [1,0,1],
   [0,1,1],
   [0,1,0]
 ]
 ```
 
 Follow up:

 + Could you solve it in-place? Remember that the board needs to be updated at the same time: You cannot update some cells first and then use their updated values to update other cells.
 + In this question, we represent the board using a 2D array. In principle, the board is infinite, which would cause problems when the active area encroaches the border of the array. How would you address these problems?

 */


import Foundation

private let markAsDead = -1 // -1 signifies the cell is now dead but originally was live.
private let markAsAlive = 2 // 2 signifies the cell is now live but was originally dead.

private func getAliveNeighboursValue(for r:Int, c: Int, board: [[Int]]) -> Int {
 
    let directions:[(Int, Int)] = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
    
    var aliveNeighbours = 0
    for eachTuple in directions {
        let row = r + eachTuple.0
        let column = c + eachTuple.1
                
        if row >= 0, row < board.count,
            column >= 0, column < board.first!.count,
            abs(board[row][column]) == 1 {

            aliveNeighbours += 1
        }
    }
    
    return aliveNeighbours
}

func gameOfLife(_ board: inout [[Int]]) {
    
    let rowCount = board.count
    let columnCount = board.first?.count ?? 0
    
    for rowIndex in 0..<rowCount {
        for columnIndex in 0..<columnCount {
            let aliveNeighbour = getAliveNeighboursValue(for: rowIndex, c: columnIndex, board: board)
                    
            // Rule 1: Any live cell with fewer than two live neighbors dies, as if caused by under-population.
            // Rule 3: Any live cell with more than three live neighbors dies, as if by over-population..
            if (aliveNeighbour < 2 || aliveNeighbour > 3) && board[rowIndex][columnIndex] == 1 {
                board[rowIndex][columnIndex] = markAsDead
            }

            // Rule 4: Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
            if aliveNeighbour == 3 && board[rowIndex][columnIndex] == 0 {
                board[rowIndex][columnIndex] = markAsAlive
            }
        }
    }
    
    for rowIndex in 0..<rowCount {
        for columnIndex in 0..<columnCount {

            if board[rowIndex][columnIndex] > 0 {
               board[rowIndex][columnIndex] = 1
            } else {
                board[rowIndex][columnIndex] = 0
            }
        }

    }
}

var testcase1 = [
  [0,1,0],
  [0,0,1],
  [1,1,1],
  [0,0,0]
]

print("Before:",testcase1)
gameOfLife(&testcase1) // [[0, 0, 0], [1, 0, 1], [0, 1, 1], [0, 1, 0]]
print("After: ",testcase1)

