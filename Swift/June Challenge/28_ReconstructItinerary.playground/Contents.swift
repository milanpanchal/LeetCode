/*:
# Reconstruct Itinerary
 
 https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/542/week-4-june-22nd-june-28th/3374/

 ---

### Problem Statement:

 Given a list of airline tickets represented by pairs of departure and arrival airports `[from, to]`, reconstruct the itinerary in order. All of the tickets belong to a man who departs from `JFK`. Thus, the itinerary must begin with `JFK`.


### Example 1:

 ```
 Input: [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]
 
 Output: ["JFK", "MUC", "LHR", "SFO", "SJC"]

 ```
 
 ### Example 2:
  ```
 Input: [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
 
 Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
 
 Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"].
              But it is larger in lexical order.

  ```

 ### Notes:
 + If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string. For example, the itinerary `["JFK", "LGA"]` has a smaller lexical order than `["JFK", "LGB"]`.
 + All airports are represented by three capital letters (IATA code).
 + You may assume all tickets form at least one valid itinerary.
 + One must use all the tickets once and only once.
 
 */

import UIKit

typealias StringArray = [String]

class Solution {
    
    //    80 / 80 test cases passed.
    //    Status: Accepted
    //    Runtime: 152 ms
    //    Memory Usage: 23.3 MB
    
    func findItinerary(_ tickets: [[String]]) -> [String] {
        
        // Generate Graph
        var map = [String:[String]]()
        for ticket in tickets {
            map[ticket.first!, default: StringArray()].append(ticket.last!)
        }
        
        // Sort the generated graph in lexical order
        map.keys.forEach { (key) in
            map[key] = map[key]?.sorted()
        }
        
        return dfs(map, tickets.count + 1)
    }
    
    func dfs(_ map: [String:[String]], _ count: Int, _ from: String = "JFK", _ itinerary: [String] = ["JFK"]) -> [String] {
        
        for (index,to) in map[from, default: StringArray()].enumerated(){
            var map = map
            map[from]!.remove(at: index)
            let result = dfs(map, count, to, itinerary + [to])
            if result.count == count {
                return result
            }
        }
        
        return itinerary
    }
}

let sol = Solution()
//sol.findItinerary([["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]])
//sol.findItinerary([["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]])
sol.findItinerary([["JFK","KUL"],["JFK","NRT"],["NRT","JFK"]]) // ["JFK","NRT","JFK","KUL"]
