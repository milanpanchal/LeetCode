/*:
# 763. Partition Labels [Medium]
  https://leetcode.com/problems/partition-labels/

 ---

 ### Problem Statement:

  A string S of lowercase English letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.

 ### Example:

  ```
  Input: S = "ababcbacadefegdehijhklij"
  Output: [9,7,8]
  
  Explanation:
  The partition is "ababcbaca", "defegde", "hijhklij".
  This is a partition so that each letter appears in at most one part.
  A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits S into less parts.

  ```
  
  
  ### Constraints:
  + S will have length in range [1, 500].
  + S will consist of lowercase English letters ('a' to 'z') only.
  
  ### Hint:
  + Try to greedily choose the smallest partition that includes the first letter. If you have something like "abaccbdeffed", then you might need to add b. You can use an map like "last['b'] = 5" to help you expand the width of your partition.

  */

 import UIKit

 class Solution {
     func partitionLabels(_ S: String) -> [Int] {
         var mapChar = [Character: Int]()
         let chars = Array(S)
         for i in 0..<chars.count {
             mapChar[chars[i]] = i
         }
         
         var curEnd = 0, curStart = 0
         var ans = [Int]()
         while curStart<chars.count {
             curEnd = mapChar[chars[curStart]]!
             var j = curStart
             while j < curEnd {
                 let end = mapChar[chars[j]]!
                 if end > curEnd {
                     curEnd = end
                 }
                 
                 j += 1
             }
             ans.append(curEnd+1-curStart)
             curStart = curEnd+1
         }
         return ans
     }
 }

 let sol = Solution()
 sol.partitionLabels("ababcbacadefegdehijhklij") // [9,7,8]
