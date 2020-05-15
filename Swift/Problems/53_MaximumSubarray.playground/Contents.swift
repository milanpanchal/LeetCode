/*:
# 53. Maximum Subarray
  https://leetcode.com/problems/maximum-subarray/
 
 ---

### Problem Statement:

 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.


### Example:

 ```
 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.

 ```
 
 ### Notes:
 + If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 
 */

import UIKit

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {

        if nums.count == 0 { return 0 }
        if nums.count == 1 { return nums[0] }

        var maxCurrent = nums[0]
        var maxGlobal = nums[0]
        
        for n in nums[1...] {
            
            maxCurrent = max(n, maxCurrent + n)
            if maxCurrent > maxGlobal {
                maxGlobal = maxCurrent
            }
        }
        
        return maxGlobal
    }
}

let obj = Solution()
obj.maxSubArray([1, -2, 3, -2]) // 3
obj.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]) // 6
