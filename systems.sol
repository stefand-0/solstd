// std/systems.sol — Low-level systems development utilities
// Direct hardware access, memory-mapped I/O, bit manipulation, and more.
// Use with caution — these can crash your program or corrupt memory.

// Bit Manipulation

pub bit_set(int val, int bit) out int
    return val | (1 << bit)

pub bit_clear(int val, int bit) out int
    return val & ~(1 << bit)

pub bit_toggle(int val, int bit) out int
    return val ^ (1 << bit)

pub bit_get(int val, int bit) out bool
    return (val >> bit) & 1

pub bit_mask(int bits) out int
    return (1 << bits) - 1

pub rotate_left(int val, int shift, int width) out int
    int mask -> bit_mask(width)
    return ((val << shift) | (val >> (width - shift))) & mask

pub rotate_right(int val, int shift, int width) out int
    int mask -> bit_mask(width)
    return ((val >> shift) | (val << (width - shift))) & mask

pub byte_swap(int val) out int
    C -> "int result = ((val & 0xFF) << 24) | ((val & 0xFF00) << 8) | ((val >> 8) & 0xFF00) | ((val >> 24) & 0xFF);"
    return result

pub popcount(int val) out int
    int count -> 0
    while (val != 0)
        count++
        val -> val & (val - 1)
    return count

pub parity(int val) out bool
    return popcount(val) % 2 == 0

// Endianness

pub is_little_endian() out bool
    C -> "int test = 1;"
    C -> "return *(char*)&test == 1;"
    return true

pub to_big_endian(int val) out int
    if (is_little_endian())
        return byte_swap(val)
    return val

pub to_little_endian(int val) out int
    if (!is_little_endian())
        return byte_swap(val)
    return val

// Memory-Mapped I/O

pub mmio_read(int addr) out int
    C -> "volatile int* ptr = (volatile int*)addr;"
    C -> "int result = *ptr;"
    return result

pub mmio_write(int addr, int val)
    C -> "volatile int* ptr = (volatile int*)addr;"
    C -> "*ptr = val;"

pub mmio_read_byte(int addr) out uint8
    C -> "volatile uint8_t* ptr = (volatile uint8_t*)addr;"
    C -> "uint8_t result = *ptr;"
    return result

pub mmio_write_byte(int addr, uint8 val)
    C -> "volatile uint8_t* ptr = (volatile uint8_t*)addr;"
    C -> "*ptr = val;"

pub mmio_read_16(int addr) out uint16
    C -> "volatile uint16_t* ptr = (volatile uint16_t*)addr;"
    C -> "uint16_t result = *ptr;"
    return result

pub mmio_write_16(int addr, uint16 val)
    C -> "volatile uint16_t* ptr = (volatile uint16_t*)addr;"
    C -> "*ptr = val;"

// Memory Barriers

pub memory_barrier()
    C -> "asm volatile(\"\" ::: \"memory\");"

pub full_memory_barrier()
    C -> "asm volatile(\"mfence\" ::: \"memory\");"

pub compiler_barrier()
    C -> "asm volatile(\"\" ::: \"memory\");"

// Cache Control

pub cache_flush(int addr)
    C -> "asm volatile(\"clflush %0\" : \"+m\" (*(char*)addr));"

pub cache_prefetch(int addr)
    C -> "asm volatile(\"prefetcht0 %0\" : : \"m\" (*(char*)addr));"

// Port I/O (x86 only)

pub port_in(uint16 port) out uint8
    C -> "uint8_t result;"
    C -> "asm volatile(\"inb %1, %0\" : \"=a\"(result) : \"Nd\"(port));"
    return result

pub port_out(uint16 port, uint8 val)
    C -> "asm volatile(\"outb %0, %1\" : : \"a\"(val), \"Nd\"(port));"

pub port_in_16(uint16 port) out uint16
    C -> "uint16_t result;"
    C -> "asm volatile(\"inw %1, %0\" : \"=a\"(result) : \"Nd\"(port));"
    return result

pub port_out_16(uint16 port, uint16 val)
    C -> "asm volatile(\"outw %0, %1\" : : \"a\"(val), \"Nd\"(port));"

// CPU Features

pub cpuid(int leaf, int subleaf) out int
    C -> "int eax, ebx, ecx, edx;"
    C -> "asm volatile(\"cpuid\" : \"=a\"(eax), \"=b\"(ebx), \"=c\"(ecx), \"=d\"(edx) : \"a\"(leaf), \"c\"(subleaf));"
    C -> "int result = eax;"
    return result

pub rdtsc() out uint64
    C -> "uint64_t result;"
    C -> "asm volatile(\"rdtsc\" : \"=A\"(result));"
    return result

pub read_msr(int msr) out uint64
    C -> "uint32_t low, high;"
    C -> "asm volatile(\"rdmsr\" : \"=a\"(low), \"=d\"(high) : \"c\"(msr));"
    C -> "uint64_t result = ((uint64_t)high << 32) | low;"
    return result

pub write_msr(int msr, uint64 val)
    C -> "uint32_t low = val & 0xFFFFFFFF;"
    C -> "uint32_t high = val >> 32;"
    C -> "asm volatile(\"wrmsr\" : : \"a\"(low), \"d\"(high), \"c\"(msr));"

// Page Tables / Virtual Memory (Linux only)

pub get_page_size() out int
    C -> "int result = sysconf(_SC_PAGESIZE);"
    return result

pub mprotect(int addr, int len, int prot)
    C -> "mprotect((void*)addr, len, prot);"

pub mmap(int addr, int len, int prot, int flags, int fd, int offset) out int
    C -> "int result = (int)(intptr_t)mmap((void*)addr, len, prot, flags, fd, offset);"
    return result

pub munmap(int addr, int len)
    C -> "munmap((void*)addr, len);"

// Interrupt Control

pub cli()
    C -> "asm volatile(\"cli\");"

pub sti()
    C -> "asm volatile(\"sti\");"

pub hlt()
    C -> "asm volatile(\"hlt\");"

// DMA

pub dma_alloc(int size) out int
    C -> "void* ptr = aligned_alloc(4096, size);"
    C -> "int result = (int)(intptr_t)ptr;"
    return result

pub dma_free(int ptr)
    C -> "free((void*)(intptr_t)ptr);"

// Watchdog / Reset

pub soft_reset()
    C -> "asm volatile(\"ljmp $0xFFFF, $0x0000\");"

pub triple_fault()
    C -> "asm volatile(\"lidt 0; int $0x80\");"

// System Info

pub get_ticks() out uint64
    return rdtsc()

pub uptime_ms() out int
    C -> "struct timespec ts;"
    C -> "clock_gettime(CLOCK_MONOTONIC, &ts);"
    C -> "int result = (int)(ts.tv_sec * 1000 + ts.tv_nsec / 1000000);"
    return result

pub cpu_count() out int
    C -> "int result = sysconf(_SC_NPROCESSORS_ONLN);"
    return result
