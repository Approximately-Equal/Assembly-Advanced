#include <stdint.h>
#include <stdio.h>


uint32_t decaying_sum_t(uint16_t* values, uint16_t length, uint16_t decay, uint32_t rolling_sum) {
    if (length <= 1) {
        return rolling_sum;
    }
    rolling_sum += values[length-2] + (values[length-1] / decay);
    return decaying_sum(values, length-1, decay, rolling_sum);
}

uint32_t decaying_sum(uint16_t* values, uint16_t length, uint16_t decay) {
    uint32_t rolling_sum = 0;
    return decaying_sum_t(values, length, decay, rolling_sum);
}


int main() {
    uint16_t* v = malloc(4*sizeof(uint16_t));
    v = {2, 4, 8, 16};
    print("%d", decaying_sum(v, 4, 2));
    return 0;
}