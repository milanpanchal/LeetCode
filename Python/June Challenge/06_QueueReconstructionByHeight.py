## Queue Reconstruction by Height
#  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3352/
#
# ---
#
#### Problem Statement:
#
# Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.
#
#
#### Example:
#
# ```
# Input:
# [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]
#
# Output:
# [[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
#
# ```
# 
# ### Hint:
# + What can you say about the position of the shortest person? If the position of the shortest person is i, how many people would be in front of the shortest person?
# + Once you fix the position of the shortest person, what can you say about the position of the second shortest person?
#
#
# ### Notes:
# +  The number of people is less than 1,100.
# 
#

from functools import cmp_to_key

class Solution:
    
    def reconstructQueue(self, people: List[List[int]]) -> List[List[int]]:
        def cmp_item1(a,b):
            if a[0] == b[0] :
                if a[1] > b[1]:
                    return -1
                return 1
            elif a[0] > b[0]:
                return 1
            return -1
        people = sorted(people, key=cmp_to_key(cmp_item1))
        
        a = [0 for _ in range(len(people))]
        for person in people:
            index = a.index(0, 0)
            temp = person[1]
            while temp > 0 :
                index += 1
                temp -= 1
                index = a.index(0, index)
            a[index] = person
        
        return a
