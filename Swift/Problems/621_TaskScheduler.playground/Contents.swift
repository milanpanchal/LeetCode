/*:
# 621. Task Scheduler
  https://leetcode.com/problems/task-scheduler/

 ---

### Problem Statement:

 You are given a char array representing tasks CPU need to do. It contains capital letters A to Z where each letter represents a different task. Tasks could be done without the original order of the array. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle.

 However, there is a non-negative integer `n` that represents the cooldown period between two same tasks (the same letter in the array), that is that there must be at least `n` units of time between any two same tasks.

 You need to return the least number of units of times that the CPU will take to finish all the given tasks.

### Example 1:

 ```
 Input: tasks = ["A","A","A","B","B","B"], n = 2
 Output: 8
 
 Explanation:
 A -> B -> idle -> A -> B -> idle -> A -> B
 There is at least 2 units of time between any two same tasks.

 ```

 ### Example 2:

 ```
 Input: tasks = ["A","A","A","B","B","B"], n = 0
 Output: 6
 
 Explanation: On this case any permutation of size 6 would work since n = 0.
 ["A","A","A","B","B","B"]
 ["A","B","A","B","A","B"]
 ["B","B","B","A","A","A"]
 ...
 And so on.

 ```
 
 ### Example 3:

 ```
 Input: tasks = ["A","A","A","A","A","A","B","C","D","E","F","G"], n = 2
 Output: 16
 
 Explanation:
 One possible solution is
 A -> B -> C -> A -> D -> E -> A -> F -> G -> A -> idle -> idle -> A -> idle -> idle -> A

 ```
 
 ### Constraints:
 + The number of tasks is in the range `[1, 10000]`.
 + The integer `n` is in the range`[0, 100]`.

 */


import UIKit

/*
 
  Explanation
  ["A","A","A","B","B","B"]
  n = 2
  map = [A: 3, B: 3]
  m = 3
  numsOfMax = 2
  
 Final result
    = number of intervals * size of each interval + number of elements with maximum frequency items.
    = (m - 1) * (n + 1) + numsOfMax
    = 2 * 3 + 2
    = 6 + 2
    = 8
 
 */
class Solution {
    
//    69 / 69 test cases passed.
//    Status: Accepted
//    Runtime: 1060 ms
//    Memory Usage: 22.7 MB

    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        
        //Create a map with frequency of tasks/characters
        var map: [Character: Int] = [:]
        for task in tasks {
            map[task, default: 0] += 1
        }
        
        // Number of Intervals is decided by most frequent element in dic.
        let m = map.values.max()!
        
        // Count elements with maximum frequency in dic.
        let numsOfMax = map.values.filter({ $0 == m }).count
        
        // number of intervals = m - 1 => between the 3 As we had to place 2 intervals => m - 1
        let numsOfIntervals = m - 1
        
        // Final result = number of intervals * size of each interval + number of elements with maximum frequency items.
        return max(tasks.count, numsOfIntervals * (n + 1) + numsOfMax)
        
    }
    
    func leastInterval2(_ tasks: [Character], _ n: Int) -> Int {
        var map = Array(repeating: 0, count: 26)
        let AValue = Character("A").asciiValue!
        for char in tasks {
            let index = Int(char.asciiValue! - AValue)
            map[index] += 1
        }
        
        let sorted = map.sorted(by: >)
        
        let maxCount = sorted[0] - 1
        var maxBlank = maxCount * n
        
        for i in 1..<26 {
            maxBlank -= min(maxCount, sorted[i])
        }
        
        maxBlank = max(maxBlank, 0)
        return tasks.count + maxBlank
    }
}



let sol = Solution()
sol.leastInterval(["A","A","A","B","B","B"], 2) // 8
sol.leastInterval(["A","A","A","B","B","B"], 0) // 6
sol.leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2) // 16
