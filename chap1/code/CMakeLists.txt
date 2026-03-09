cmake_minimum_required(VERSION 3.10)

project(chap1_code)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 让 clangd 生效的核心
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# 编译
add_executable(q2_run Q_2.cpp)
add_executable(q3_run Q_3.cpp)

# (可选) 开启警告
target_compile_options(q2_run PRIVATE -Wall -Wextra)
target_compile_options(q3_run PRIVATE -Wall -Wextra)