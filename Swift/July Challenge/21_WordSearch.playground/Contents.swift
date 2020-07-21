/*:
# Word Search
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/546/week-3-july-15th-july-21st/3397/

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

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        return false
    }
}

let sol = Solution()
let board:[[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
sol.exist(board, "ABCCED")  // true
sol.exist(board, "SEE")     // true
sol.exist(board, "ABCB")    // false
