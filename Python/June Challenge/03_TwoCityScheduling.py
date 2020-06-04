# Two City Scheduling
#  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3349/
#
# ---
#
#### Problem Statement:
# There are 2N people a company is planning to interview. The cost of flying the i-th person to city A is costs[i][0], and the cost of flying the i-th person to city B is costs[i][1].
#
#Return the minimum cost to fly every person to a city such that exactly N people arrive in each city.
#
# 
#
#Example 1:
#
#Input: [[10,20],[30,200],[400,50],[30,20]]
#Output: 110
#Explanation: 
#The first person goes to city A for a cost of 10.
#The second person goes to city A for a cost of 30.
#The third person goes to city B for a cost of 50.
#The fourth person goes to city B for a cost of 20.
#
#The total minimum cost is 10 + 30 + 50 + 20 = 110 to have half the people interviewing in each city.
#
# 
#
#Note:
#
#    1 <= costs.length <= 100
#    It is guaranteed that costs.length is even.
#    1 <= costs[i][0], costs[i][1] <= 1000
#


class Solution:
    def twoCitySchedCost(self, costs: List[List[int]]) -> int:
        def moveAtoB(No):
          citya.sort(key=lambda x: x[1]-x[0])
          while No>0:
            cityb.append(citya[0])
            del citya[0]
            No -=1

        def moveBtoA(No):
          cityb.sort(key=lambda x: x[0]-x[1])
          while No>0:
            citya.append(cityb[0])
            del cityb[0]
            No -=1

        citya = []
        cityb = []
        for a in costs:
          if a[0] > a[1]:
            cityb.append(a)
          else:
            citya.append(a)
        

        (cityalen, cityblen) = (len(citya), len(cityb))

        if cityalen > cityblen:
          moveAtoB((cityalen - cityblen) //2)
        if cityalen < cityblen:
          moveBtoA((cityblen - cityalen) //2)
        
        sum1  = sum([pair[0] for pair in citya])
        sum2 = sum([pair[1] for pair in cityb])

        return sum1+sum2

