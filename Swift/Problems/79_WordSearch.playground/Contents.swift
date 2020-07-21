/*:
# 79. Word Search
  https://leetcode.com/problems/word-search/

 ---

### Problem Statement:

 Given a 2D board and a word, find if the word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.


### Example:

 ```
 board =
 [
   ['A','B','C','E'],
   ['S','F','C','S'],
   ['A','D','E','E']
 ]

 Given word = "ABCCED", return true.
 Given word = "SEE", return true.
 Given word = "ABCB", return false.

 ```
 
 ### Constraints:
 + `board` and `word` consists only of lowercase and uppercase English letters.
 + 1 <= board.length <= 200
 + 1 <= board[i].length <= 200
 + 1 <= word.length <= 10^3

 */


import UIKit

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

class Solution {
    

//    89 / 89 test cases passed.
//    Status: Accepted
//    Runtime: 920 ms
//    Memory Usage: 22 MB

    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if word.count == 0 {
            return true
        }
        
        
        var board = board
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                
                if board[i][j] == word.first!,
                    dfs(&board, i, j, 0, word){
                    return true
                }
            }
        }
        
        return false
    }
    
    
    private func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int, _ count: Int, _ word: String) -> Bool {
        if count == word.count {
            return true
        }
        
        if i < 0 || i >= board.count || j < 0 || j >= board[i].count || board[i][j] != word[count] {
            return false
        }
        
        let temp = board[i][j]
        board[i][j] = "#"
        let wordFound = dfs(&board, i+1, j, count + 1, word) ||
                        dfs(&board, i-1, j, count + 1, word) ||
                        dfs(&board, i, j+1, count + 1, word) ||
                        dfs(&board, i, j-1, count + 1, word)
        
        board[i][j] = temp
        return wordFound
    }
}

let sol = Solution()
let board:[[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
sol.exist(board, "ABCCED")  // true
sol.exist(board, "SEE")     // true
sol.exist(board, "ABCB")    // false

