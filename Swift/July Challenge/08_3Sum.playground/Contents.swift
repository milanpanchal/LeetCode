/*:
# 3Sum
  https://leetcode.com/explore/featured/card/july-leetcoding-challenge/545/week-2-july-8th-july-14th/3384/

 ---

### Problem Statement:
 
 Given an array `nums` of n integers, are there elements a, b, c in `nums` such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

### Example:

 ```
 Given array nums = [-1, 0, 1, 2, -1, -4],

 A solution set is:
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]
 
 ```
 
 ### Constraints:
 + So, we essentially need to find three numbers x, y, and z such that they add up to the given value. If we fix one of the numbers say x, we are left with the two-sum problem at hand!

 + For the two-sum problem, if we fix one of the numbers, say `x` , we have to scan the entire array to find the next number `y` which is `value - x` where value is the input parameter. Can we change our array somehow so that this search becomes faster?

 + The second train of thought for two-sum is, without changing the array, can we use additional space somehow? Like maybe a hash map to speed up the search?

 ### Notes:
 + The solution set must not contain duplicate triplets.
 
 */

import UIKit

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
    }
}

let sol = Solution()
sol.threeSum([-1,0,1,2,-1,-4]) // [[-1, 0, 1], [-1, -1, 2]]

