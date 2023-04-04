;;; Segment .fini (0000000000005ED4)

;; _fini: 0000000000005ED4
_fini proc
	endbr64
	sub	rsp,8h
	add	rsp,8h
	ret
