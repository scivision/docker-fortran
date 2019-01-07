cmake_minimum_required(VERSION 3.13)  # just to show it's Docker not Travis native
project(DockerExample Fortran)
enable_testing()

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules/)

find_package(Coarray REQUIRED)

add_executable(hello coarray_hello.f90)
target_compile_options(hello PRIVATE ${Coarray_COMPILE_OPTIONS})
target_link_libraries(hello PRIVATE ${Coarray_LIBRARIES})
add_test(NAME HelloWorld
  COMMAND ${Coarray_EXECUTABLE} ${Coarray_NUMPROC_FLAG} ${Coarray_MAX_NUMPROCS} ./hello)
