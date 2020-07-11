/*:
# Flatten a Multilevel Doubly Linked List
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/545/week-2-july-8th-july-14th/3386/

 ---

### Problem Statement:

 You are given a doubly linked list which in addition to the next and previous pointers, it could have a child pointer, which may or may not point to a separate doubly linked list. These child lists may have one or more children of their own, and so on, to produce a multilevel data structure, as shown in the example below.

 Flatten the list so that all the nodes appear in a single-level, doubly linked list. You are given the head of the first level of the list.


### Example 1:

 ```
 Input: head = [1,2,3,4,5,6,null,null,null,7,8,9,10,null,null,11,12]
 Output: [1,2,3,7,8,11,12,9,10,4,5,6]
 Explanation:

 The multilevel linked list in the input is as follows:
 
 1---2---3---4---5---6--NULL
         |
         7---8---9---10--NULL
             |
             11--12--NULL

 ```
 
 ### Example 2:
 
 ```
 Input: head = [1,2,null,3]
 Output: [1,3,2]
 Explanation:

 The input multilevel linked list is as follows:

   1---2---NULL
   |
   3---NULL

 ```
 
 ### Example 2:
 
 ```
 Input: head = []
 Output: []

 ```
 ### Constraints:
 + Number of Nodes will not exceed 1000.
 + 1 <= Node.val <= 10^5

 */

import UIKit

// Definition for a Node.
public class Node {
    public var val: Int
    public var prev: Node?
    public var next: Node?
    public var child: Node?
    public init(_ val: Int) {
        self.val = val
        self.prev = nil
        self.next = nil
        self.child  = nil
    }
}

// Nodes
let node1 = Node(1)
let node2 = Node(2)
let node3 = Node(3)
let node4 = Node(4)
let node5 = Node(5)
let node6 = Node(6)
let node7 = Node(7)
let node8 = Node(8)
let node9 = Node(9)
let node10 = Node(10)
let node11 = Node(11)
let node12 = Node(12)

// Next nodes
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6

node7.next = node8
node8.next = node9
node9.next = node10

node11.next = node12

// Previous nodes

node6.prev = node5
node5.prev = node4
node4.prev = node3
node3.prev = node2
node2.prev = node1

node10.prev = node9
node9.prev = node8
node8.prev = node7

node12.prev = node11

// Child nodes

node3.child = node7
node8.child = node11


class Solution {
    func flatten(_ head: Node?) -> Node? {
        return head
    }
}

let sol = Solution()
sol.flatten(node1)
