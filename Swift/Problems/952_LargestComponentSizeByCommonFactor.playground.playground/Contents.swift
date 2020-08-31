/*:
# 952. Largest Component Size by Common Factor [Hard]
https://leetcode.com/problems/largest-component-size-by-common-factor

 ---

### Problem Statement:

 Given a non-empty array of unique positive integers A, consider the following graph:

 + There are `A.length` nodes, labelled `A[0]` to `A[A.length - 1]`;
 + There is an edge between `A[i]` and `A[j]` if and only if `A[i]` and `A[j]` share a common factor greater than 1.
 
 Return the size of the largest connected component in the graph.


### Example:

 ```
 Input: [4,6,15,35]
 Output: 4

 Input: [20,50,9,63]
 Output: 2

 Input: [2,3,6,7,4,12,21,39]
 Output: 8

 ```

 ### Notes:
 + 1 <= A.length <= 20000
 + 1 <= A[i] <= 100000
 
 */


import UIKit

// Sol: https://leetcode.com/jtbergman/
// https://leetcode.com/problems/largest-component-size-by-common-factor/discuss/820371/Swift-Solution-(Beats-100)

// 100 / 100 test cases passed.
// Status: Accepted
// Runtime: 3692 ms
// Memory Usage: 24.4 MB

class Solution {
    func largestComponentSize(_ A: [Int]) -> Int {
        let uf = UnionFind((A.max() ?? 0) + 1)
        var map = [Int: Int]()
        
        for num in A {
            let primes = factors(num)
            map[num] = primes[0]
            
            for i in 0 ..< primes.count - 1 where primes[i] != primes[i+1] {
                uf.union(primes[i], primes[i+1])
            }
        }
         
        var count = [Int: Int]()
        for num in A {
            let group = uf.group(map[num]!)
            count[group, default: 0] += 1
        }
        
        return count.values.max() ?? 0
    }
    
    func factors(_ num: Int) -> [Int] {
        var result = [Int]()
        var factor = 2
        var num = num
        
        var prev = 1
        while num >= factor * factor {
            if num % factor == 0 {
                if factor != prev {
                    result.append(factor)
                }
                prev = factor
                num = num / factor
            } else {
                factor += 1
            }
        }
        
        result.append(num)
        return result
    }
}



// MARK: Union Find

public class UnionFind {
    
    // MARK: Properties

    public private(set) var arr: [Int]
    public private(set) var size: [Int]


    // MARK: Initialization
    
    /// Initializes Union Find with n objects
    public init(_ n: Int) {
        self.arr = Array(0 ..< n)
        self.size = Array(repeating: 1, count: n)
    }


    // MARK: Methods

    /// Connects the set containing p with the set containing q
    public func union(_ p: Int, _ q: Int) {
        let pid = group(p)
        let qid = group(q)
        guard pid != qid else { return }
        let (small, big) = size[pid] < size[qid] ?
            (pid, qid) : (qid, pid)
        size[big] += size[small]
        arr[small] = big
    }

    /// Returns true if and only if p and q are connected
    public func find(_ p: Int, _ q: Int) -> Bool {
        let pid = group(p)
        let qid = group(q)
        return pid == qid
    }

    /// Returns the root of r and performs path compression
    public func root(_ r: Int) -> Int {
        var r = r
        while arr[r] != r {
            arr[r] = arr[arr[r]]
            r = arr[r]
        }
        return r
    }
    
    public func group(_ r: Int) -> Int {
        var r = r
        while arr[r] != r {
            r = arr[r]
        }
        return r
    }
}


let sol = Solution()
sol.largestComponentSize([4,6,15,35])
sol.largestComponentSize([20,50,9,63])
sol.largestComponentSize([2,3,6,7,4,12,21,39])


