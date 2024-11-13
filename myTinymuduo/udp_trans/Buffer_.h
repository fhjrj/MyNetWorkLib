#ifndef BUFFER__
#define BUFFER__

#include <sys/time.h>
#include <time.h>

    class SlidWinBuffer
    {
        public:
        SlidWinBuffer() {}
        ~SlidWinBuffer() {}

        int first_byte_;
        int data_length_;
        int seq_num_;//序列号，不是应答号
        struct timeval time_sent_;
    };


#endif