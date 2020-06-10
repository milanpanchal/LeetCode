/*:
# 35. Search Insert Position

https://leetcode.com/problems/search-insert-position
 
 ---

### Problem Statement:
 
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You may assume no duplicates in the array.

### Example:

 ```
 Input: [1,3,5,6], 5
 Output: 2

 Input: [1,3,5,6], 2
 Output: 1

 Input: [1,3,5,6], 7
 Output: 4

 Input: [1,3,5,6], 0
 Output: 0

 ```

 */

import UIKit

func searchInsert(_ nums: [Int], _ target: Int) -> Int {

//    if nums.count == 0 || target < nums[0] { return 0 }
//    if target > nums.last! { return nums.count }
    
    var leftIndex = 0
    var rightIndex = nums.count - 1
    
    while leftIndex < rightIndex {
        let midIndex = (leftIndex + rightIndex)/2
        if nums[midIndex] == target {
            return midIndex
        } else if nums[midIndex] < target {
            leftIndex = midIndex + 1
        } else {
            rightIndex = midIndex - 1
        }
    }
    
    return (nums[leftIndex] < target) ? leftIndex + 1 : leftIndex
}

searchInsert([1,3,5,6], 5) // 2
searchInsert([1,3,5,6], 2) // 1
searchInsert([1,3,5,6], 7) // 4
searchInsert([1,3,5,6], 0) // 0
searchInsert([1], 0) // 0
