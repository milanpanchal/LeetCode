/*:
# 1480. Running Sum of 1d Array
  https://leetcode.com/problems/running-sum-of-1d-array/

 ---

### Problem Statement:

 Given an array `nums`. We define a running sum of an array as `runningSum[i] = sum(nums[0]…nums[i]`).

 Return the running sum of `nums`.

### Example:

 ```
 Input: nums = [1,2,3,4]
 Output: [1,3,6,10]
 Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].

 Input: nums = [1,1,1,1,1]
 Output: [1,2,3,4,5]
 
 Input: nums = [3,1,2,10,1]
 Output: [3,4,6,16,17]

 ```
 
 ### Constraints:
 + 1 <= nums.length <= 1000
 + -10^6 <= nums[i] <= 10^6
 
 */


import UIKit

class Solution {
    
//    53 / 53 test cases passed.
//    Status: Accepted
//    Runtime: 28 ms
//    Memory Usage: 20.9 MB

    func runningSum(_ nums: [Int]) -> [Int] {
        if nums.count == 0 {
            return []
        }
        
        var rSum = [Int]()
        rSum.append(nums[0])
        
        for i in 1..<nums.count {
            rSum.append(rSum[i-1] + nums[i])
        }
        return rSum
    }
    
    // Using HOF
    func runningSum2(_ nums: [Int]) -> [Int] {
        var currentRunningSum = 0
        return nums.map {
            currentRunningSum += $0
            return currentRunningSum
        }
    }
}

let sol = Solution()
sol.runningSum([1,2,3,4])       // [1,3,6,10]
sol.runningSum([1,1,1,1,1])     // [1,2,3,4,5]
sol.runningSum([3,1,2,10,1])    // [3,4,6,16,17]
