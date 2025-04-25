## output from `a.c`:
```asm
Size: 32 KB, Average pointer chase latency: 1.39 ns
Size: 64 KB, Average pointer chase latency: 1.74 ns
Size: 128 KB, Average pointer chase latency: 4.66 ns
Size: 256 KB, Average pointer chase latency: 4.66 ns
Size: 512 KB, Average pointer chase latency: 5.46 ns
Size: 1024 KB, Average pointer chase latency: 5.28 ns
Size: 2048 KB, Average pointer chase latency: 6.61 ns
Size: 4096 KB, Average pointer chase latency: 7.73 ns
Size: 8192 KB, Average pointer chase latency: 10.41 ns
Size: 16384 KB, Average pointer chase latency: 41.69 ns
Size: 32768 KB, Average pointer chase latency: 69.04 ns
Size: 1048576 KB, Average pointer chase latency: 101.26 ns
```

## some theory:
chip: macbook pro m4 10 cores\
baseline clock rate: 4.4 GHz

```
time per cycle  = 1 / clock rate
                = 1 / 4_400_000_000
                = 0.000_000_000_227 s
                = 0.227 ns
```

so for 64 KB, number of cycles for the memory access is:\
`1.74 ns/0.227 ns = 7.66 cycles`

for 1 GB, num cycles:\
`101.26/0.227 = 446 cycles`
