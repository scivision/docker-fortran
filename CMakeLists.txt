cmake_minimum_required(VERSION 3.13)  # just to show it's Docker not Travis native
project(DockerExample Fortran)
enable_testing()

add_executable(hello hello_world.f90)
add_test(NAME HelloWorld COMMAND hello)
