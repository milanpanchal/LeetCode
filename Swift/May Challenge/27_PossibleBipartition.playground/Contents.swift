/*:
# Possible Bipartition
  https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/537/week-4-may-22nd-may-28th/3342/

 ---

### Problem Statement:

 Given a set of `N` people (numbered `1, 2, ..., N`), we would like to split everyone into two groups of any size.

 Each person may dislike some other people, and they should not go into the same group.

 Formally, if `dislikes[i] = [a, b]`, it means it is not allowed to put the people numbered a and b into the same group.

 Return true if and only if it is possible to split everyone into two groups in this way.


### Example:

 ```
 Input: N = 4, dislikes = [[1,2],[1,3],[2,4]]
 Output: true
 Explanation: group1 [1,4], group2 [2,3]

 Input: N = 3, dislikes = [[1,2],[1,3],[2,3]]
 Output: false

 Input: N = 5, dislikes = [[1,2],[2,3],[3,4],[4,5],[1,5]]
 Output: false

 ```

 ### Notes:
 + 1 <= N <= 2000
 + 0 <= dislikes.length <= 10000
 + 1 <= dislikes[i][j] <= N
 + dislikes[i][0] < dislikes[i][1]
 + There does not exist i != j for which dislikes[i] == dislikes[j].
 
 */

class Solution {
    var hashMap = [Int: [Int]]()
    var visited = [Int]()

    func dfs(_ node: Int, _ color: Int) -> Bool {
        if visited[node] != 0, visited[node] != color {
            return false
        }
        
        if visited[node] == color {
            return true
        }

        visited[node] = color
        guard let neighbours = hashMap[node] else {
            return true
        }

        for eachNeighbour in neighbours {
            if !dfs(eachNeighbour, -color) { return false}
        }

        return true
    }

    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {


        guard N > 0, dislikes.count > 0 else {
            return true
        }
        
        
        for eachDislike in dislikes {
            let a = eachDislike[0]
            let b = eachDislike[1]
            
            hashMap[a] = (hashMap[a] ?? []) + [b]
            hashMap[b] = (hashMap[b] ?? []) + [a]
        }
        print(hashMap)
        visited = Array(repeating: 0, count: N+1)
        for i in 0..<N {
            if visited[i] == 0 {
                if !dfs(i,1) {
                    return false
                }
            }
        }
      
        return true
    }
}


Solution().possibleBipartition(4, [[1,2],[1,3],[2,4]])
Solution().possibleBipartition(3, [[1,2],[1,3],[2,3]])
Solution().possibleBipartition(5, [[1,2],[2,3],[3,4],[4,5],[1,5]])



class Solution2 {
    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        var graph:[[Int]] = []
        for i in 0..<N{
            graph.append([])
        }
        for i in dislikes{
            let from = i[0]-1
            let to = i[1]-1
            graph[from].append(to)
            graph[to].append(from)
        }
        var visited = Array(repeating: 0, count: graph.count)
        for i in 0..<N{
            if 0 == visited[i]{
                let res = bfs(i ,graph, &visited)
                if !res{
                    return false
                }
            }
        }
        return true
    }
    
    func bfs(_ node:Int, _ graph:[[Int]], _ visited:inout[Int])->Bool{
        var queue:[Int] = []
        queue.append(node)
        visited[node] = 1

        while !queue.isEmpty{
            let item = queue.removeFirst()
            for child in graph[item]{
                if visited[child] == 0{
                    visited[child] = visited[item] == 1 ? 2 : 1
                    queue.append(child)
                }else{
                    if visited[child] == visited[item] { return false }
                }
            }
        }
        return true
    }
}
