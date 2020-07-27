/*:
# Find Minimum in Rotated Sorted Array II
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/547/week-4-july-22nd-july-28th/3401/

 ---

### Problem Statement:
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e.,  `[0,1,2,4,5,6,7]` might become  `[4,5,6,7,0,1,2]`).

 Find the minimum element.

 The array may contain duplicates.



### Example:

 ```
 Input: [1,3,5]
 Output: 1

 Input: [2,2,2,0,1]
 Output: 0
 
 ```
 
 ### Notes:
 + This is a follow up problem to Find Minimum in [Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/)
 + Would allow duplicates affect the run-time complexity? How and why?

 */


import UIKit

class Solution {
    
//    192 / 192 test cases passed.
//    Status: Accepted
//    Runtime: 28 ms
//    Memory Usage: 20.8 MB

    func findMin(_ nums: [Int]) -> Int {
        
        var min = nums.first ?? Int.min
        
        for n in nums[1...] {
            if n < min {
                min = n
            }
        }
        
        return min
    }
    
    func findMin1(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = (left + right) / 2
            
            if nums[mid] > nums[right] {
                left = mid + 1
            } else if nums[mid] < nums[right] {
                right = mid
            } else {
                right -= 1
            }
        }
        
        return nums[left]
    }
}

let sol = Solution()
sol.findMin([1,3,5]) // 1
sol.findMin1([2,2,2,0,1]) // 0

