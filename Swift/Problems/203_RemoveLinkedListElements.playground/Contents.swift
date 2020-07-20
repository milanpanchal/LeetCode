/*:
# 203. Remove Linked List Elements
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/546/week-3-july-15th-july-21st/3396/

 ---

### Problem Statement:

 Remove all elements from a linked list of integers that have value `val`.

### Example:

 ```
 Input:  1->2->6->3->4->5->6, val = 6
 Output: 1->2->3->4->5

 ```
 */


import UIKit


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
//    65 / 65 test cases passed.
//    Status: Accepted
//    Runtime: 88 ms
//    Memory Usage: 22.6 MB

    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        if head == nil {
            return nil
        }
        
        var node = head

        while node?.next != nil {
            if node?.next?.val == val {
                node?.next = node?.next?.next
            } else {
                node = node?.next
            }
        }
        
        return head!.val == val ? head!.next : head!
    }
    
    func removeElements2(_ head: ListNode?, _ val: Int) -> ListNode? {
        var tmp = ListNode(-1, head), vHead = tmp
        
        while let next = tmp.next {
            if next.val == val {
                tmp.next = next.next
            } else {
                tmp = next
            }
        }
        return vHead.next
    }
    
    func printList(_ head: ListNode?) {
        var head = head
        while head != nil {
            print(head!.val)
            head = head?.next
        }
    }
}


let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(6)
head.next?.next?.next?.next = ListNode(4)
head.next?.next?.next?.next?.next = ListNode(5)
head.next?.next?.next?.next?.next?.next = ListNode(6)

let sol = Solution()
let result = sol.removeElements(head, 6)
sol.printList(result)

