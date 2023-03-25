cmake_minimum_required (VERSION 3.0)

set(CMAKE_CXX_COMPILER dpcpp)

# Set default build type to RelWithDebInfo if not specified
if (NOT CMAKE_BUILD_TYPE)
    message (STATUS "Default CMAKE_BUILD_TYPE not set using Release with Debug Info")
    set (CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE
        STRING "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel"
        FORCE)
endif()
project (mandelbrot)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -w")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}")
add_executable (mandelbrot src/main.cpp)
target_link_libraries(mandelbrot OpenCL sycl $ENV{ONEAPI_ROOT}/compiler/latest/linux/lib/libsycl-complex.o)
#add_custom_target (run ./mandelbrot)
add_custom_target(run ${CMAKE_COMMAND} -E env SYCL_DEVICE_FILTER=PI_OPENCL ./mandelbrot)
