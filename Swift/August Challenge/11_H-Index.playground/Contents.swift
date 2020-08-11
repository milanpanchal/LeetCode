/*:
# H-Index
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3420/

 ---

### Problem Statement:

 Given an array of citations (each citation is a non-negative integer) of a researcher, write a function to compute the researcher's h-index.

 According to the [definition of h-index on Wikipedia](https://en.wikipedia.org/wiki/H-index): "A scientist has index h if h of his/her N papers have at least h citations each, and the other N − h papers have no more than h citations each."


### Example:

 ```
 Input: citations = [3,0,6,1,5]
 Output: 3
 Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had
              received 3, 0, 6, 1, 5 citations respectively.
              Since the researcher has 3 papers with at least 3 citations each and the remaining
              two with no more than 3 citations each, her h-index is 3.

 ```
 
 ### Hint:
 + An easy approach is to sort the array first.
 + What are the possible values of h-index?
 + A faster approach is to use extra space.


 ### Notes:
 + If there are several possible values for h, the maximum one is taken as the h-index.

 */


import UIKit

class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        
    }
}

let sol = Solution()
sol.hIndex([3,0,6,1,5]) // 3

