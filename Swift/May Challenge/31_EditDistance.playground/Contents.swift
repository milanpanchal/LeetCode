/*:
# Edit Distance
  https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/538/week-5-may-29th-may-31st/3346/
 
 ---

### Problem Statement:

 Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.

 You have the following 3 operations permitted on a word:

 - Insert a character
 - Delete a character
 - Replace a character



### Example 1:

 ```
 Input: word1 = "horse", word2 = "ros"
 
 Output: 3
 
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')

 ```
 
 ### Example 2:

 ```
 Input: word1 = "intention", word2 = "execution"

 Output: 5

 Explanation:
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')

 ```
 */

import UIKit

func minDistance(_ word1: String, _ word2: String) -> Int {

    return 0
}

minDistance("horse", "ros") // 3
minDistance("intention", "execution") // 5

