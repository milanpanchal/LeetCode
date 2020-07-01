/*:
# Word Search II
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/543/week-5-june-29th-june-30th/3376/

 ---

### Problem Statement:

 Given a 2D board and a list of words from the dictionary, find all words in the board.

 Each word must be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.


### Example:

 ```
 Input:
 board = [
   ['o','a','a','n'],
   ['e','t','a','e'],
   ['i','h','k','r'],
   ['i','f','l','v']
 ]
 words = ["oath","pea","eat","rain"]

 Output: ["eat","oath"]

 ```

 ### Notes:
 + All inputs are consist of lowercase letters a-z.
 + The values of `words` are distinct.
 
 */

import UIKit

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
     
        return []
    }
}

let sol = Solution()
sol.findWords([["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]]
, ["oath","pea","eat","rain"])
