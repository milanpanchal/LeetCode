/*:
# Kth Largest Element in an Array
 https://leetcode.com/problems/kth-largest-element-in-an-array/
 
 ---

### Problem Statement:

 Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.


### Example:

 ```
 Input: [3,2,1,5,6,4] and k = 2
 Output: 5

 Input: [3,2,3,1,2,4,5,5,6] and k = 4
 Output: 4

 ```
 
 ### Notes:
 + You may assume k is always valid, 1 ≤ k ≤ array's length.
 
 */

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        
    let sorted = nums.sorted(by: >)
    return sorted[k-1]
}

findKthLargest([3,2,1,5,6,4], 2) // 5
findKthLargest([3,2,3,1,2,4,5,5,6], 4) // 4
