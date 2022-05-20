cmake_minimum_required(VERSION 3.14)

project(M3iTimeMeasure)

file(GLOB RELS_LIST src/rels/*)
list(LENGTH RELS_LIST RELS_COUNT)
math(EXPR RELS_END "${RELS_COUNT} - 1")
message(STATUS "[M3i_STATUS] Found realisatinos [0..=${RELS_END}]")

set (CMAKE_CXX_STANDARD 11)

foreach(i RANGE 0 ${RELS_END})
    message(STATUS "[M3i_STATUS] Working with src/rels/${i}")
    message(STATUS "[M3i_STATUS] Adding library m3i_${i}")
    add_library(m3i_${i} src/rels/${i}/m3i.cpp)
    target_include_directories(m3i_${i} PRIVATE src/rels/${i}/)

    message(STATUS "[M3i_STATUS] Adding executable measure_${i}")
    add_executable(measure_${i} src/measure/measure.cpp)
    target_include_directories(measure_${i} PRIVATE src/rels/${i}/)
    target_link_libraries(measure_${i} m3i_${i})
    
    message(STATUS "[M3i_STATUS] Done")
endforeach()
