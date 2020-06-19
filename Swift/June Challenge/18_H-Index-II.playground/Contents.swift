/*:
# H-Index II
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/541/week-3-june-15th-june-21st/3364/

 ---

### Problem Statement:

 Given an array of citations sorted in ascending order (each citation is a non-negative integer) of a researcher, write a function to compute the researcher's h-index.

 According to the definition of h-index on Wikipedia: "A scientist has index h if h of his/her N papers have at least h citations each, and the other N − h papers have no more than h citations each."

 https://en.wikipedia.org/wiki/H-index

### Example:

 ```
 Input: citations = [0,1,3,5,6]
 Output: 3
 Explanation: [0,1,3,5,6] means the researcher has 5 papers in total and each of them had
              received 0, 1, 3, 5, 6 citations respectively.
              Since the researcher has 3 papers with at least 3 citations each and the remaining
              two with no more than 3 citations each, her h-index is 3.
 ```
 
 ### Follow up:
 + This is a follow up problem to H-Index(https://leetcode.com/problems/h-index/description/), where `citations` is now guaranteed to be sorted in ascending order.
 + Could you solve it in logarithmic time complexity?

 ### Notes:
 + If there are several possible values for h, the maximum one is taken as the h-index.
 
 */

import UIKit

class Solution {
    func hIndex(_ citations: [Int]) -> Int {

        let totalPapers = citations.count
        for i in 0..<totalPapers {
            if citations[i] >= totalPapers - i {
                return totalPapers - i
            }
        }
        return 0
    }
}

let obj = Solution()
obj.hIndex([0,1,3,5,6]) // 3
