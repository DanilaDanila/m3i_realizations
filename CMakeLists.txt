cmake_minimum_required(VERSION 3.14)

project(M3iTimeMeasure)

include_directories(src/rels)

######### LIBS #########

add_library(m3i0 src/rels/m3i_0.cpp)
target_compile_definitions(m3i0 PUBLIC -DREL0)

add_library(m3i1 src/rels/m3i_1.cpp)
target_compile_definitions(m3i1 PUBLIC -DREL1)

add_library(m3i2 src/rels/m3i_2.cpp)
target_compile_definitions(m3i2 PUBLIC -DREL2)

##### REALIZATIONS #####

add_executable(rel0 src/rels/m3i/m3i.h src/measure/measure.cpp)
target_link_libraries(rel0 m3i0)

add_executable(rel1 src/rels/m3i/m3i.h src/measure/measure.cpp)
target_link_libraries(rel1 m3i1)

add_executable(rel2 src/rels/m3i/m3i.h src/measure/measure.cpp)
target_link_libraries(rel2 m3i2)
