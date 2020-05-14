/*:
# Single Element in a Sorted Array
 
 https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3327/

 ---

### Problem Statement:

 You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once. Find this single element that appears only once.

### Example:

 ```
 Input: [1,1,2,3,3,4,4,8,8]
 Output: 2

 Input: [3,3,7,7,10,11,11]
 Output: 10

 ```

 ### Notes:
 + Your solution should run in O(log n) time and O(1) space.
 
 */

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {

        var numSet:Set<Int> = Set<Int>()
        
        for n in nums {
            if numSet.contains(n) {
                numSet.remove(n)
            } else {
                numSet.insert(n)
            }
        }
        
        
        return numSet.first ?? -1
    }
    
    func singleNonDuplicateRevised(_ nums: [Int]) -> Int {

        var result = nums[0]
        for i in 1..<nums.count {
            result ^= nums[i]
            print(result)
        }
        
        return result
    }
}

let obj = Solution()
obj.singleNonDuplicate([1,1,2,3,3,4,4,8,8])
obj.singleNonDuplicateRevised([3,3,7,7,10,11,11])
