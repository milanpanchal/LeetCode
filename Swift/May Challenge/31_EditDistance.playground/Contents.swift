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

    if word1 == word2 { return 0 }
    
    var dp = Array(repeating: Array(repeating: 0, count: word2.count+1), count: word1.count+1)
    let word1Array = Array(word1)
    let word2Array = Array(word2)
    
    for i in 0...word1.count {
        for j in 0...word2.count {
            if i == 0 {
                dp[i][j] = j
            } else if j == 0 {
                dp[i][j] = i
            } else if word1Array[i-1] == word2Array[j-1] {
                dp[i][j] = dp[i-1][j-1]
            } else {
                dp[i][j] = min(dp[i-1][j-1], dp[i][j-1], dp[i-1][j]) + 1
            }
        }
    }
    return dp.last?.last ?? -1
}

minDistance("horse", "ros") // 3
minDistance("intention", "execution") // 5

