/*:
# 905. Sort Array By Parity [Easy]
  https://leetcode.com/problems/sort-array-by-parity/

 ---

### Problem Statement:

 Given an array `A` of non-negative integers, return an array consisting of all the even elements of `A`, followed by all the odd elements of `A`.

 You may return any answer array that satisfies this condition.


### Example:

 ```
 Input: [3,1,2,4]
 Output: [2,4,3,1]
 The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.

 ```
 
 ### Constraints:
 + 1 <= A.length <= 5000
 + 0 <= A[i] <= 5000

 */


import UIKit

class Solution {
    
//    285 / 285 test cases passed.
//    Status: Accepted
//    Runtime: 144 ms
//    Memory Usage: 21.2 MB

    func sortArrayByParity(_ A: [Int]) -> [Int] {
     
        var result = [Int]()
        
        for num in A {
            if num % 2 == 0 {
                result.insert(num, at: 0)
            } else {
                result.append(num)
            }
        }
        return result
    }
    

//    285 / 285 test cases passed.
//    Status: Accepted
//    Runtime: 168 ms
//    Memory Usage: 21.1 MB

    func sortArrayByParity1(_ A: [Int]) -> [Int] {
        return A.filter({ $0 % 2 == 0 }) + A.filter({ $0 % 2 == 1 })
    }
    
    func sortArrayByParity2(_ A: [Int]) -> [Int] {
        var A = A
        var left = 0
        var right = A.count - 1
        while left < right {
            if A[left] % 2 != 0 && A[right] % 2 == 0 {
                A.swapAt(left, right)
                left += 1
                right -= 1
            } else if A[right] % 2 != 0 {
                right -= 1
            } else if A[right] % 2 == 0 {
                left += 1
            }
        }
        return A
    }
}

let sol = Solution()
sol.sortArrayByParity([3,1,2,4])
sol.sortArrayByParity1([3,1,2,4])
sol.sortArrayByParity2([3,1,2,4])
