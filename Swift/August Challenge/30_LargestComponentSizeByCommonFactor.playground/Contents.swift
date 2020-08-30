/*:
# Largest Component Size by Common Factor

https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/553/week-5-august-29th-august-31st/3442/

 ---

### Problem Statement:

 Given a non-empty array of unique positive integers A, consider the following graph:

 + There are `A.length` nodes, labelled `A[0]` to `A[A.length - 1]`;
 + There is an edge between `A[i]` and `A[j]` if and only if `A[i]` and `A[j]` share a common factor greater than 1.
 
 Return the size of the largest connected component in the graph.


### Example:

 ```
 Input: [4,6,15,35]
 Output: 4

 Input: [20,50,9,63]
 Output: 2

 Input: [2,3,6,7,4,12,21,39]
 Output: 8

 ```

 ### Notes:
 + 1 <= A.length <= 20000
 + 1 <= A[i] <= 100000
 
 */


import UIKit

class Solution {
    func largestComponentSize(_ A: [Int]) -> Int {
        
    }
}

let sol = Solution()
sol.largestComponentSize([4,6,15,35])
sol.largestComponentSize([20,50,9,63])
sol.largestComponentSize([2,3,6,7,4,12,21,39])

