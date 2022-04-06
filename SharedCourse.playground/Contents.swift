import Foundation

let student_course_pairs_1 : [[String]] = [
  ["58", "Linear Algebra"],
  ["94", "Art History"],
  ["94", "Operating Systems"],
  ["17", "Software Design"],
  ["58", "Mechanics"],
  ["58", "Economics"],
  ["17", "Linear Algebra"],
  ["17", "Political Science"],
  ["94", "Economics"],
  ["25", "Economics"],
  ["58", "Software Design"],
]

let student_course_pairs_2: [[String]] = [
  ["0", "Advanced Mechanics"],
  ["0", "Art History"],
  ["1", "Course 1"],
  ["1", "Course 2"],
  ["2", "Computer Architecture"],
  ["3", "Course 1"],
  ["3", "Course 2"],
  ["4", "Algorithms"],
]

let input = student_course_pairs_2


func getSharedCourse(_ input: [[String]]) -> [String: [String]] {
    // step1
    var courseDic: [Int: [String]] = [:]
    
    for course in input {
        let sid = Int(course[0])!
        if courseDic[sid] == nil {
            courseDic[sid] = [course[1]]
        } else {
            var courses = courseDic[sid] ?? []
            courses.append(course[1])
            courseDic[sid] = courses
        }
    }
    
    // step 2: pairing up sids
    var idPairs:[(Int, Int)] = []
    let ids = Array(Set(courseDic.keys)).sorted()
    
    for first in 0..<ids.count-1 {
        for second in first+1..<ids.count {
            idPairs.append((ids[first], ids[second]))
        }
    }
    
    // step3: get shared courses
    var result: [String: [String]] = [:]
    for pair in idPairs {
        let courses = courseDic[pair.0]?.filter{ courseDic[pair.1]!.contains($0) }
        result["\(pair.0),\(pair.1)"] = courses
    }
    
    return result
}

print(getSharedCourse(input))
