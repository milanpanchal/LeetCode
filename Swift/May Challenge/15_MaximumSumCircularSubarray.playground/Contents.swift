/*:
# Maximum Sum Circular Subarray
  https://leetcode.com/explore/featured/card/may-leetcoding-challenge/536/week-3-may-15th-may-21st/3330/
 
 ---

### Problem Statement:

 Given a circular array C of integers represented by `A`, find the maximum possible sum of a non-empty subarray of `C`.

 Here, a circular array means the end of the array connects to the beginning of the array.  (Formally, `C[i] = A[i]` when `0 <= i < A.length`, and `C[i+A.length] = C[i]` when `i >= 0`.)

 Also, a subarray may only include each element of the fixed buffer `A` at most once.  (Formally, for a subarray `C[i], C[i+1], ..., C[j]`, there does not exist `i <= k1, k2 <= j` with `k1 % A.length = k2 % A.length`.)


### Example:

 ```
 Input: [1,-2,3,-2]
 Output: 3
 Explanation: Subarray [3] has maximum sum 3

 
 Input: [5,-3,5]
 Output: 10
 Explanation: Subarray [5,5] has maximum sum 5 + 5 = 10

 
 Input: [3,-1,2,-1]
 Output: 4
 Explanation: Subarray [2,-1,3] has maximum sum 2 + (-1) + 3 = 4

 
 Input: [3,-2,2,-3]
 Output: 3
 Explanation: Subarray [3] and [3,-2,2] both have maximum sum 3

 Input: [-2,-3,-1]
 Output: -1
 Explanation: Subarray [-1] has maximum sum -1

 ```
 
 ### Notes:
 + -30000 <= A[i] <= 30000
 + 1 <= A.length <= 30000
 
 ### Hint
 + Kadane's algorithm is used to finding the maximum sum subarray from a given array
 
 */


import UIKit

class Solution {
    
    private func kadaneAlgorithm(nums: [Int]) -> Int {
     
        var maxCurrent = nums[0]
        var maxGlobal = nums[0]

        for value in nums[1...] {
            maxCurrent = max(value, maxCurrent + value)
            if maxCurrent > maxGlobal {
                maxGlobal = maxCurrent
            }
        }

        return maxGlobal
    }
    
    func maxSubarraySumCircular(_ A: [Int]) -> Int {

        if A.count == 0 { return 0 }
        if A.count == 1 { return A[0] }

        var localMax    = A[0]
        var globalMax   = A[0]
        var localMin    = A[0]
        var globalMin   = A[0]
        var total       = A[0]
        
        for value in A[1...] {
            localMax    = max(localMax + value, value)
            globalMax   = max(localMax, globalMax)
            localMin    = min(localMin + value, value)
            globalMin   = min(localMin, globalMin)
            total       += value
        }
        
        return globalMax < 0 ? globalMax : max(globalMax, total - globalMin)
    }
        
}

let obj = Solution()
obj.maxSubarraySumCircular([1, -2, 3, -2]) // 3
obj.maxSubarraySumCircular([5, -3, 5]) // 10
obj.maxSubarraySumCircular([3,-1,2,-1]) // 4
obj.maxSubarraySumCircular([3,-2,2,-3]) // 3
obj.maxSubarraySumCircular([-2,-3,-1]) // -1
obj.maxSubarraySumCircular([8, -8, 9, -9, 10, -11, 12]) // 22
obj.maxSubarraySumCircular([10, -3, -4, 7, 6, 5, -4, -1]) // 23
