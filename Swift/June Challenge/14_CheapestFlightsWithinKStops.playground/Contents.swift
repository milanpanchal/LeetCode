/*:
# Cheapest Flights Within K Stops
  https://leetcode.com/explore/featured/card/june-leetcoding-challenge/540/week-2-june-8th-june-14th/3360/

 ---

### Problem Statement:

 There are `n` cities connected by `m` flights. Each flight starts from city `u` and arrives at `v` with a price `w`.

 Now given all the cities and flights, together with starting city `src` and the destination `dst`, your task is to find the cheapest price from `src` to `dst` with up to `k` stops. If there is no such route, output `-1`.

### Example 1:

 ```
 Input:
 n = 3, edges = [[0,1,100],[1,2,100],[0,2,500]]
 src = 0, dst = 2, k = 1
 Output: 200
 Explanation:
 The graph looks like this:
 
        0
       / \
 100  /   \     500
     V     V
    1------->2
        100
 
 The cheapest price from city 0 to city 2 with at most 1 stop costs 200, as marked red in the picture.

 ```
 
 ### Example 2:

 ```
 Input:
 n = 3, edges = [[0,1,100],[1,2,100],[0,2,500]]
 src = 0, dst = 2, k = 0
 Output: 500
 
 The cheapest price from city 0 to city 2 with at most 0 stop costs 500, as marked blue in the picture.

 ```
 
 ### Constraints:
 + The number of nodes n will be in range [1, 100], with nodes labeled from 0 to n - 1.
 + The size of flights will be in range [0, n * (n - 1) / 2].
 + The format of each flight will be (src, dst, price).
 + The price of each flight will be in the range [1, 10000].
 + k is in the range of [0, n - 1].
 + There will not be any duplicated flights or self cycles.
 
 */

import UIKit

//45 / 45 test cases passed.
//Status: Accepted
//Runtime: 112 ms
//Memory Usage: 20.9 MB

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    
    // check If source == destination
    if src == dst { return 0 }

    // Mapping location
    var locationMap: [Int: [(Int, Int)]] = [:]
    for routeAndPrice in flights {
        locationMap[routeAndPrice[0], default: []].append((routeAndPrice[1], routeAndPrice[2]))
    }
    print(locationMap)
    
    var queue = [(src, 0, 0)]
    var weights = [src:0]
    
    while queue.count > 0 {
        let node = queue.removeFirst()
        let key = node.0
        let w = node.1
        let k = node.2

        if k <= K, let locationsFromStop = locationMap[key] {
            for loc in locationsFromStop {
                let stopNo = loc.0
                let weight = loc.1
                if weights[stopNo] == nil || w+weight < weights[stopNo]! {
                    weights[stopNo] = w+weight
                    queue.append((stopNo, w+weight, k+1))
                }
            }
        }
    }
    
    return weights[dst] ?? -1
}

findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 1)
findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 0)
