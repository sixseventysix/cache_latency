#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>

typedef struct Node {
    struct Node* next;
} Node;

void shuffle(Node** array, size_t n) {
    for (size_t i = n - 1; i > 0; --i) {
        size_t j = rand() % (i + 1);
        Node* tmp = array[i];
        array[i] = array[j];
        array[j] = tmp;
    }
}

uint64_t now_ns() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (uint64_t)ts.tv_sec * 1000000000ULL + ts.tv_nsec;
}

int main() {
    size_t sizes[] = {
        32 * 1024, 64 * 1024, 128 * 1024, 256 * 1024, 512 * 1024,
        1024 * 1024, 2 * 1024 * 1024, 4 * 1024 * 1024, 8 * 1024 * 1024,
        16 * 1024 * 1024, 32 * 1024 * 1024, 1024 * 1024 * 1024
    };
    size_t num_sizes = sizeof(sizes) / sizeof(sizes[0]);
    size_t iters = 10000000; // number of pointer chases per test

    for (size_t s = 0; s < num_sizes; ++s) {
        size_t num_nodes = sizes[s] / sizeof(Node);
        if (num_nodes < 2) continue;

        Node** nodes = malloc(num_nodes * sizeof(Node*));
        for (size_t i = 0; i < num_nodes; ++i)
            nodes[i] = malloc(sizeof(Node));
        shuffle(nodes, num_nodes);
        for (size_t i = 0; i < num_nodes - 1; ++i)
            nodes[i]->next = nodes[i + 1];
        nodes[num_nodes - 1]->next = nodes[0];

        // volatile keyword ensures it treats the memory access as a real memory access.
        // it doesn't get optimized away or cached
        volatile Node* current = nodes[0];
        uint64_t start = now_ns();
        for (size_t i = 0; i < iters; ++i) {
            current = current->next;
            // this line is a memory barrier
            // doesn't allow compiler optimizations across it (in this case, memory access across iterations will not be interleaved)   
            // ```
            // asm volatile("" : : : "memory");
            // ```
        }
        uint64_t end = now_ns();

        double avg_latency_ns = (double)(end - start) / iters;
        printf("Size: %zu KB, Average pointer chase latency: %.2f ns\n", sizes[s] / 1024, avg_latency_ns);

        for (size_t i = 0; i < num_nodes; ++i)
            free(nodes[i]);
        free(nodes);
    }
    return 0;
}