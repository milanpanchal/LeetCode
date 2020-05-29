
/*:
# Counting Bits
  https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/537/week-4-may-22nd-may-28th/3343/

 ---

### Problem Statement:

 Given a non negative integer number num. For every numbers `i` in the range `0 ≤ i ≤ num` calculate the number of 1's in their binary representation and return them as an array.


### Example:

 ```
 Input: 2
 Output: [0,1,1]

 Input: 5
 Output: [0,1,1,2,1,2]

 ```
 
 ### Follow up:
 + It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
 + Space complexity should be O(n).
 + Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.
 
 ### Hint:
 + You should make use of what you have produced already.
 + Divide the numbers in ranges like [2-3], [4-7], [8-15] and so on. And try to generate new range from previous.
 + Or does the odd/even status of the number help you in calculating the number of 1s?

 */

private func numberOfSetBitsWithRecursionFor(_ num: Int) -> Int {
    if num == 0 { return 0 }
    return (num & 1) + numberOfSetBitsWithRecursionFor(num >> 1)
}

private func numberOfSetBitsFor(_ n: Int) -> Int {

    var num = n
    var count = 0
    while num > 0 {
        count += num & 1
        num >>= 1
    }
    return count
}

// Brian Kernighan’s Algorithm:
// Subtracting 1 from a decimal number flips all the bits after the rightmost set bit(which is 1) including the rightmost set bit.

private func numberOfSetBitsUsingBrianKernighanAlgo(_ n: Int) -> Int {

    var num = n
    var count = 0
    while num > 0 {
        num &= (num - 1)
        count += 1
    }
    return count
}

func countBits(_ num: Int) -> [Int] {
    var bitsArray = [Int]()
    for n in 0...num {
        bitsArray.append(numberOfSetBitsFor(n))
    }
    return bitsArray
}

func countBitsRevised(_ num: Int) -> [Int] {
    guard num > 0 else { return [0] }
    var dp: [Int] = Array(repeating: 0, count: num + 1)
    for i in 1...num {
        dp[i] = dp[i & (i-1)] + 1
    }
    return dp
}





numberOfSetBitsUsingBrianKernighanAlgo(5) // 2
numberOfSetBitsUsingBrianKernighanAlgo(6) // 2
numberOfSetBitsUsingBrianKernighanAlgo(13) // 3

countBits(2) // [0,1,1]
countBitsRevised(5) // [0,1,1,2,1,2]
