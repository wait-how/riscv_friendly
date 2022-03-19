.macro fence_tests

	Suite_setup fence

test_fence_1:
    # basic fence tests
    fence iorw, iorw
    fence rw, rw
    fence r, r
    fence w, w

    # I/O-memory fence tests
    fence io, rw
    fence rw, io

    # memory write fence tests
    fence r, w
    fence w, r
    fence w, rw
.endm
