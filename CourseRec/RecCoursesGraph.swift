//
//  RecCoursesGraph.swift
//  CourseRec
//
//  Created by Quang Nguyen on 3/22/17.
//  Copyright © 2017 Quang Nguyen. All rights reserved.
//

import UIKit

// Recommended Courses Graph
class RecCoursesGraph {
    // TODO
    // create directed graph for cs courses
    
    var recCoursesGraph = UnweightedGraph<String>()
    
    // MARK: Initialization
    init() {
        initGraph()
    }
    
    func initGraph() {
        var indexFrom: Int
        var indexTo: Int
        
        // add edges for courses with prereq: MATH 1300
        indexFrom = recCoursesGraph.addVertex("MATH 1300") // vertex 0
        indexTo = recCoursesGraph.addVertex("CS 1160") // vertex 1
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex("MATH 1304") // vertex 2
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)

        // add edges for courses with prereq: MATH 1304
        indexFrom = indexTo
        indexTo = recCoursesGraph.addVertex("MATH 2150") // vertex 3
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex("MATH 1305") // vertex 4
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: MATH 1305
        indexFrom = indexTo
        indexTo = recCoursesGraph.addVertex("MATH 2304") // vertex 5
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex("MATH 2101") // vertex 6
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex("STAT 3601") // vertex 7
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // no edges for STAT 3401
        recCoursesGraph.addVertex("STAT 3401") // vertex 8
        
        // add edges for courses with prereq: CS 1160
        indexFrom = 1
        indexTo = recCoursesGraph.addVertex("CS 2360") // vertex 9
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex("CS 2430") // vertex 10
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 2360
        indexFrom = 9
        indexTo = recCoursesGraph.addVertex("CS 2370") // vertex 11
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)

        indexTo = recCoursesGraph.addVertex("CS 3560") // vertex 17
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 2360 and CS 2430
        indexFrom = 9
        indexTo = recCoursesGraph.addVertex("CS 3120") // vertex 12
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 10
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: MATH 2150, CS 2370, CS 2430
        indexFrom = 3
        indexTo = recCoursesGraph.addVertex("CS 3240") // vertex 13
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)

        indexFrom = 11
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)

        indexFrom = 10
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)

        // add edges for courses with prereq: CS 3240
        indexFrom = 13
        indexTo = recCoursesGraph.addVertex("CS 3340") // vertex 14
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex("CS 3520") // vertex 20
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex("CS 4310") // vertex 24
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex("CS 4320") // vertex 26
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex("CS 4660") // vertex 30
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex("CS 4810") // vertex 32
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: MATH 2150, CS 2430
        indexFrom = 3
        indexTo = recCoursesGraph.addVertex("CS 3430") // vertex 15
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 10
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)

        // add edges for courses with prereq: CS 3240 and CS 3430
        indexFrom = 13
        indexTo = recCoursesGraph.addVertex("CS 4560") // vertex 16
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 15
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 2370 and CS 3430
        indexFrom = 11
        indexTo = recCoursesGraph.addVertex("CS 3590") // vertex 18
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 15
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 3240, CS 3560 and CS 3590
        indexFrom = 13
        indexTo = recCoursesGraph.addVertex("CS 4590") // vertex 19
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 17
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 18
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 3120, CS 3240
        indexFrom = 12
        indexTo = recCoursesGraph.addVertex("CS 4110") // vertex 21
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 13
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: MATH 1305, MATH 2101, MATH 2150
        indexFrom = 4
        indexTo = recCoursesGraph.addVertex("CS 4170") // vertex 22
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 6
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 3
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: MATH 1305, MATH 2101, CS 3240
        indexFrom = 4
        indexTo = recCoursesGraph.addVertex("CS 4245") // vertex 23
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 6
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 13
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 3340, CS 4310
        indexFrom = 14
        indexTo = recCoursesGraph.addVertex("CS 4311") // vertex 25
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 24
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 3430
        indexFrom = 15
        indexTo = recCoursesGraph.addVertex("CS 4435") // vertex 27
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 3520
        indexFrom = 20
        indexTo = recCoursesGraph.addVertex("CS 4521") // vertex 28
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 3590
        indexFrom = 18
        indexTo = recCoursesGraph.addVertex("CS 4596") // vertex 29
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex("CS 4525") // vertex 31
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        
        
    }
    
    func getRecCourses(uCourses: [Course]) -> [String] {
        var dict = [String: String]()
        var toRtn = [String]()
        
        for course in uCourses {
            for neighbor in self.recCoursesGraph.neighborsForVertex(course.name)! {
                dict[neighbor] = neighbor
            }
        }
        
        for (key, _) in dict {
            toRtn.append(key)
        }
        
        return toRtn
    }

}
