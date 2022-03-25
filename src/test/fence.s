.macro fence_tests

	Suite_Setup fence

	# NOTE: in-depth testing of fence is really hard without making assumptions, so these tests just run fence instructions unconditionally to test for correct decoding

test_fence_1:
    # basic fence tests
	fence i, i
	fence o, o
    fence r, r
    fence w, w

test_fence_2:
	# combined fence tests
    fence rw, rw
    fence iorw, iorw

test_fence_3:
    # I/O-memory fence tests
    fence io, rw
    fence rw, io

test_fence_4:
    # memory write fence tests
    fence r, w
    fence w, r
    fence w, rw

test_fence_tso:
	# this is an optional extension to the fence instruction
	# but not part of the Ztso extension!
	fence.tso

.endm
