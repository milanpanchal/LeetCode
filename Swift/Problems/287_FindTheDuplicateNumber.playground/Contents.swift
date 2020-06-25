/*:
# 287. Find the Duplicate Number
 https://leetcode.com/problems/find-the-duplicate-number/

 ---

### Problem Statement:

 Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.


### Example:

 ```
 Input: [1,3,4,2,2]
 Output: 2

 Input: [3,1,3,4,2]
 Output: 3
 
 ```
 
 ### Notes:
 + You must not modify the array (assume the array is read only).
 + You must use only constant, O(1) extra space.
 + Your runtime complexity should be less than O(n2).
 + There is only one duplicate number in the array, but it could be repeated more than once.

 */

import UIKit

class Solution {

    //    Brute force solution
    //    53 / 53 test cases passed.
    //    Status: Accepted
    //    Runtime: 1936 ms
    //    Memory Usage: 21.3 MB

    func findDuplicate(_ nums: [Int]) -> Int {
        
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if nums[i] == nums[j] {
                    return nums[i]
                }
            }
        }
        
        return Int.max
    }
    
    // Modifies the array by sorting
    // O(n log n)
    // 53 / 53 test cases passed.
    // Status: Accepted
    // Runtime: 164 ms
    // Memory Usage: 21.5 MB

    func findDuplicate1(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        for i in 1 ..< nums.count {
            if nums[i] == nums[i-1] {
                return nums[i]
            }
        }
        return Int.max
    }

    // 53 / 53 test cases passed.
    // Status: Accepted
    // Runtime: 80 ms
    // Memory Usage: 20.7 MB

    func findDuplicate2(_ nums: [Int]) -> Int {
        var hashMap = [Int:Int]()
        for n in nums {
            if hashMap[n] != nil {
                return n
            }
            hashMap[n] = 1
        }
        return Int.max
    }

}

let sol = Solution()
sol.findDuplicate([1,3,4,2,2]) // 2
sol.findDuplicate1([3,1,3,4,2]) // 3
sol.findDuplicate2([3,1,3,4,2]) // 3

