;;; Segment .init (0000000000002000)

;; _init: 0000000000002000
;;   Called from:
;;     0000000000005E6C (in __libc_csu_init)
_init proc
	endbr64
	sub	rsp,8h
	lea	rax,[0000000000002290]                                 ; [rip+00000281]
	test	rax,rax
	jz	2016h

l0000000000002014:
	call	rax

l0000000000002016:
	add	rsp,8h
	ret
