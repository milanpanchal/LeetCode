/*:
# 60. Permutation Sequence
 https://leetcode.com/problems/permutation-sequence/
 
 ---

### Problem Statement:

 The set `[1,2,3,...,n]` contains a total of n! unique permutations.

 By listing and labeling all of the permutations in order, we get the following sequence for n = 3:

 + "123"
 + "132"
 + "213"
 + "231"
 + "312"
 + "321"
 
 Given `n` and `k`, return the `kth` permutation sequence.


### Example:

 ```
 Input: n = 3, k = 3
 Output: "213"

 Input: n = 4, k = 9
 Output: "2314"

 ```
 
 ### Notes:
 + Given n will be between 1 and 9 inclusive.
 + Given k will be between 1 and n! inclusive.
 
 */


import UIKit

// 200 / 200 test cases passed.
// Status: Accepted
// Runtime: 4 ms
// Memory Usage: 21.3 MB

class Solution {
    
    // Helper function
    private func factorials(_ n: Int) -> [Int] {
        var resullt = [1]
        for i in 1..<n {
            resullt.append(resullt[i-1]*i)
        }
        return resullt
    }
    
    func getPermutation(_ n: Int, _ k: Int) -> String {
        
        var kMutable = k - 1
        var numbers = (1...n).map{ String($0) }
        var result = ""
        
        // print(factorials(n))
        for c in factorials(n).reversed() {
            result += numbers.remove(at: kMutable / c)
            kMutable %= c
        }
        
        return result
        
    }
}

let obj = Solution()
obj.getPermutation(3, 3) // 213
obj.getPermutation(5, 9) // 2314
obj.getPermutation(1, 1) // 1

