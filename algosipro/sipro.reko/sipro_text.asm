;;; Segment .text (0000000000002260)

;; _start: 0000000000002260
_start proc
	endbr64
	xor	ebp,ebp
	mov	r9,rdx
	pop	rsi
	mov	rdx,rsp
	and	rsp,0F0h
	push	rax
	push	rsp
	lea	r8,[0000000000005EB0]                                  ; [rip+00003C36]
	lea	rcx,[0000000000005E40]                                 ; [rip+00003BBF]
	lea	rdi,[0000000000005837]                                 ; [rip+000035AF]
	call	[0000000000008FC8]                                    ; [rip+00006D3A]
	hlt
000000000000228F                                              90                .

;; __gmon_start__: 0000000000002290
__gmon_start__ proc
	endbr64
	mov	eax,[00000000000092E8]                                 ; [rip+0000704E]
	test	eax,eax
	jz	22A0h

l000000000000229E:
	ret
000000000000229F                                              90                .

l00000000000022A0:
	sub	rsp,8h
	lea	rdi,[0000000000002260]                                 ; [rip-0000004B]
	lea	rsi,[0000000000005EE1]                                 ; [rip+00003C2F]
	mov	[00000000000092E8],1h                                  ; [rip+0000702C]
	call	21C0h
	mov	rdi,[0000000000008FC0]                                 ; [rip+00006CF8]
	add	rsp,8h
	jmp	5EC0h
00000000000022D1    66 2E 0F 1F 84 00 00 00 00 00 0F 1F 44 00 00  f...........D..

;; _dl_relocate_static_pie: 00000000000022E0
_dl_relocate_static_pie proc
	endbr64
	ret
00000000000022E5                66 2E 0F 1F 84 00 00 00 00 00 90      f..........

;; deregister_tm_clones: 00000000000022F0
;;   Called from:
;;     0000000000002387 (in __do_global_dtors_aux)
deregister_tm_clones proc
	lea	rdi,[00000000000092C0]                                 ; [rip+00006FC9]
	lea	rax,[00000000000092C0]                                 ; [rip+00006FC2]
	cmp	rax,rdi
	jz	2318h

l0000000000002303:
	mov	rax,[0000000000008FB8]                                 ; [rip+00006CAE]
	test	rax,rax
	jz	2318h

l000000000000230F:
	jmp	rax
0000000000002311    0F 1F 80 00 00 00 00                          .......       

l0000000000002318:
	ret
0000000000002319                            0F 1F 80 00 00 00 00          .......

;; register_tm_clones: 0000000000002320
;;   Called from:
;;     00000000000023A0 (in frame_dummy)
register_tm_clones proc
	lea	rdi,[00000000000092C0]                                 ; [rip+00006F99]
	lea	rsi,[00000000000092C0]                                 ; [rip+00006F92]
	sub	rsi,rdi
	mov	rax,rsi
	shr	rsi,3Fh
	sar	rax,3h
	add	rsi,rax
	sar	rsi,1h
	jz	2358h

l0000000000002344:
	mov	rax,[0000000000008FD8]                                 ; [rip+00006C8D]
	test	rax,rax
	jz	2358h

l0000000000002350:
	jmp	rax
0000000000002352       66 0F 1F 44 00 00                           f..D..       

l0000000000002358:
	ret
0000000000002359                            0F 1F 80 00 00 00 00          .......

;; __do_global_dtors_aux: 0000000000002360
__do_global_dtors_aux proc
	endbr64
	cmp	[00000000000092EC],0h                                  ; [rip+00006F81]
	jnz	2398h

l000000000000236D:
	push	rbp
	cmp	[0000000000008FE0],0h                                  ; [rip+00006C6A]
	mov	rbp,rsp
	jz	2387h

l000000000000237B:
	mov	rdi,[0000000000009008]                                 ; [rip+00006C86]
	call	2140h

l0000000000002387:
	call	22F0h
	mov	[00000000000092EC],1h                                  ; [rip+00006F59]
	pop	rbp
	ret
0000000000002395                0F 1F 00                              ...       

l0000000000002398:
	ret
0000000000002399                            0F 1F 80 00 00 00 00          .......

;; frame_dummy: 00000000000023A0
frame_dummy proc
	endbr64
	jmp	2320h

;; setCarry: 00000000000023A9
;;   Called from:
;;     00000000000026B5 (in shiftr_f)
;;     00000000000027D8 (in shiftl_f)
;;     000000000000291F (in and_f)
;;     0000000000002A7C (in or_f)
;;     0000000000002BD9 (in xor_f)
;;     0000000000002CF5 (in not_f)
;;     000000000000301E (in add_f)
;;     00000000000031C6 (in sub_f)
;;     0000000000003310 (in sub_f)
;;     00000000000033CE (in sub_f)
;;     000000000000357D (in mul_f)
;;     0000000000003848 (in div_f)
;;     00000000000039A9 (in cp_f)
;;     0000000000003B10 (in loadw_f)
;;     0000000000003C76 (in storew_f)
;;     0000000000003DE9 (in loadb_f)
;;     0000000000003F52 (in storeb_f)
;;     00000000000040B7 (in const_f)
;;     0000000000004181 (in push_f)
;;     0000000000004299 (in pop_f)
;;     0000000000004457 (in cmp_f)
;;     000000000000461B (in uless_f)
;;     0000000000004790 (in sless_f)
;;     0000000000004B8E (in call_f)
;;     0000000000004CCE (in callprintfd_f)
;;     0000000000004DDD (in callprintfu_f)
;;     0000000000004EE5 (in callprintfs_f)
;;     0000000000004FE7 (in callscanfd_f)
;;     0000000000005123 (in callscanfu_f)
;;     0000000000005344 (in callscanfs_f)
;;     00000000000053A1 (in nop_f)
setCarry proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00006C15]
	mov	[rbp-4h],edi
	cmp	dword ptr [rbp-4h],0h
	jz	23CCh

l00000000000023C4:
	cmp	dword ptr [rbp-4h],1h
	jz	23DDh

l00000000000023CA:
	jmp	23EEh

l00000000000023CC:
	mov	eax,[0000000000009304]                                 ; [rip+00006F32]
	and	eax,0FDh
	mov	[0000000000009304],eax                                 ; [rip+00006F29]
	jmp	2416h

l00000000000023DD:
	mov	eax,[0000000000009304]                                 ; [rip+00006F21]
	or	eax,2h
	mov	[0000000000009304],eax                                 ; [rip+00006F18]
	jmp	2416h

l00000000000023EE:
	mov	rax,[00000000000092E0]                                 ; [rip+00006EEB]
	mov	edx,[rbp-4h]
	lea	rsi,[00000000000060F8]                                 ; [rip+00003CF9]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	edi,1h
	call	2230h

l0000000000002416:
	nop
	leave
	ret

;; setError: 0000000000002419
;;   Called from:
;;     00000000000026C9 (in shiftr_f)
;;     00000000000027EC (in shiftl_f)
;;     0000000000002933 (in and_f)
;;     0000000000002A90 (in or_f)
;;     0000000000002BED (in xor_f)
;;     0000000000002CFF (in not_f)
;;     0000000000003032 (in add_f)
;;     00000000000031D0 (in sub_f)
;;     0000000000003324 (in sub_f)
;;     00000000000033E2 (in sub_f)
;;     00000000000035B6 (in mul_f)
;;     0000000000003832 (in div_f)
;;     000000000000383E (in div_f)
;;     00000000000039BD (in cp_f)
;;     0000000000003B24 (in loadw_f)
;;     0000000000003C8A (in storew_f)
;;     0000000000003DFD (in loadb_f)
;;     0000000000003F66 (in storeb_f)
;;     00000000000040CB (in const_f)
;;     000000000000418B (in push_f)
;;     00000000000042BD (in pop_f)
;;     0000000000004306 (in pop_f)
;;     00000000000044CD (in cmp_f)
;;     000000000000462F (in uless_f)
;;     00000000000047A4 (in sless_f)
;;     0000000000004B98 (in call_f)
;;     0000000000004CE2 (in callprintfd_f)
;;     0000000000004DF1 (in callprintfu_f)
;;     0000000000004EF9 (in callprintfs_f)
;;     000000000000505F (in callscanfd_f)
;;     000000000000506B (in callscanfd_f)
;;     0000000000005185 (in callscanfu_f)
;;     0000000000005191 (in callscanfu_f)
;;     000000000000535F (in callscanfs_f)
;;     00000000000053B5 (in nop_f)
setError proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00006BA5]
	mov	[rbp-4h],edi
	cmp	dword ptr [rbp-4h],0h
	jz	243Ch

l0000000000002434:
	cmp	dword ptr [rbp-4h],1h
	jz	244Dh

l000000000000243A:
	jmp	245Eh

l000000000000243C:
	mov	eax,[0000000000009304]                                 ; [rip+00006EC2]
	and	eax,0FEh
	mov	[0000000000009304],eax                                 ; [rip+00006EB9]
	jmp	2486h

l000000000000244D:
	mov	eax,[0000000000009304]                                 ; [rip+00006EB1]
	or	eax,1h
	mov	[0000000000009304],eax                                 ; [rip+00006EA8]
	jmp	2486h

l000000000000245E:
	mov	rax,[00000000000092E0]                                 ; [rip+00006E7B]
	mov	edx,[rbp-4h]
	lea	rsi,[0000000000006120]                                 ; [rip+00003CB1]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	edi,1h
	call	2230h

l0000000000002486:
	nop
	leave
	ret

;; setZero: 0000000000002489
;;   Called from:
;;     00000000000026BF (in shiftr_f)
;;     00000000000027E2 (in shiftl_f)
;;     0000000000002929 (in and_f)
;;     0000000000002A86 (in or_f)
;;     0000000000002BE3 (in xor_f)
;;     0000000000002D43 (in not_f)
;;     0000000000003028 (in add_f)
;;     00000000000031BC (in sub_f)
;;     000000000000331A (in sub_f)
;;     00000000000033D8 (in sub_f)
;;     000000000000358F (in mul_f)
;;     000000000000385A (in div_f)
;;     00000000000039B3 (in cp_f)
;;     0000000000003B1A (in loadw_f)
;;     0000000000003C80 (in storew_f)
;;     0000000000003DF3 (in loadb_f)
;;     0000000000003F5C (in storeb_f)
;;     00000000000040C1 (in const_f)
;;     0000000000004195 (in push_f)
;;     00000000000042A3 (in pop_f)
;;     00000000000044C3 (in cmp_f)
;;     0000000000004625 (in uless_f)
;;     000000000000479A (in sless_f)
;;     0000000000004BA2 (in call_f)
;;     0000000000004CD8 (in callprintfd_f)
;;     0000000000004DE7 (in callprintfu_f)
;;     0000000000004EEF (in callprintfs_f)
;;     0000000000004FF1 (in callscanfd_f)
;;     000000000000512D (in callscanfu_f)
;;     0000000000005355 (in callscanfs_f)
;;     00000000000053AB (in nop_f)
setZero proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00006B35]
	mov	[rbp-4h],edi
	cmp	dword ptr [rbp-4h],0h
	jz	24ACh

l00000000000024A4:
	cmp	dword ptr [rbp-4h],1h
	jz	24BDh

l00000000000024AA:
	jmp	24CEh

l00000000000024AC:
	mov	eax,[0000000000009304]                                 ; [rip+00006E52]
	and	eax,0FBh
	mov	[0000000000009304],eax                                 ; [rip+00006E49]
	jmp	24F6h

l00000000000024BD:
	mov	eax,[0000000000009304]                                 ; [rip+00006E41]
	or	eax,4h
	mov	[0000000000009304],eax                                 ; [rip+00006E38]
	jmp	24F6h

l00000000000024CE:
	mov	rax,[00000000000092E0]                                 ; [rip+00006E0B]
	mov	edx,[rbp-4h]
	lea	rsi,[0000000000006148]                                 ; [rip+00003C69]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	edi,1h
	call	2230h

l00000000000024F6:
	nop
	leave
	ret

;; getCarry: 00000000000024F9
;;   Called from:
;;     00000000000049E7 (in jmpc_f)
getCarry proc
	endbr64
	push	rbp
	mov	rbp,rsp
	call	[0000000000008FD0]                                    ; [rip+00006AC9]
	mov	eax,[0000000000009304]                                 ; [rip+00006DF7]
	and	eax,2h
	test	eax,eax
	setnz	al
	movzx	eax,al
	pop	rbp
	ret

;; getError: 000000000000251A
;;   Called from:
;;     0000000000004AB8 (in jmpe_f)
getError proc
	endbr64
	push	rbp
	mov	rbp,rsp
	call	[0000000000008FD0]                                    ; [rip+00006AA8]
	mov	eax,[0000000000009304]                                 ; [rip+00006DD6]
	and	eax,1h
	test	eax,eax
	setnz	al
	movzx	eax,al
	pop	rbp
	ret

;; getZero: 000000000000253B
;;   Called from:
;;     0000000000004916 (in jmpz_f)
getZero proc
	endbr64
	push	rbp
	mov	rbp,rsp
	call	[0000000000008FD0]                                    ; [rip+00006A87]
	mov	eax,[0000000000009304]                                 ; [rip+00006DB5]
	and	eax,4h
	test	eax,eax
	setnz	al
	movzx	eax,al
	pop	rbp
	ret

;; registerSgn: 000000000000255C
;;   Called from:
;;     00000000000025A5 (in registerToLongInt)
;;     0000000000002E30 (in add_internal)
;;     0000000000002E3F (in add_internal)
;;     0000000000002E50 (in add_internal)
;;     0000000000002E5C (in add_internal)
;;     00000000000036CA (in div_f)
;;     00000000000036EE (in div_f)
registerSgn proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,8h
	call	[0000000000008FD0]                                    ; [rip+00006A62]
	mov	[rbp-4h],edi
	mov	eax,[rbp-4h]
	and	eax,8000h
	test	eax,eax
	jz	2584h

l000000000000257D:
	mov	eax,0FFFFFFFFh
	jmp	2589h

l0000000000002584:
	mov	eax,1h

l0000000000002589:
	leave
	ret

;; registerToLongInt: 000000000000258B
;;   Called from:
;;     000000000000317F (in sub_f)
;;     00000000000031AD (in sub_f)
;;     000000000000334B (in sub_f)
;;     0000000000003514 (in mul_f)
;;     000000000000353A (in mul_f)
;;     000000000000371B (in div_f)
;;     0000000000003742 (in div_f)
;;     0000000000003766 (in div_f)
;;     000000000000378F (in div_f)
;;     00000000000037B6 (in div_f)
;;     00000000000037DA (in div_f)
;;     000000000000475B (in sless_f)
;;     0000000000004780 (in sless_f)
;;     0000000000004D15 (in callprintfd_f)
;;     000000000000543F (in printSIPRO)
;;     00000000000054E9 (in printSIPRO)
registerToLongInt proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,18h
	call	[0000000000008FD0]                                    ; [rip+00006A33]
	mov	[rbp-14h],edi
	mov	eax,[rbp-14h]
	mov	edi,eax
	call	255Ch
	test	eax,eax
	jns	25B7h

l00000000000025AE:
	mov	rax,-1h
	jmp	25BCh

l00000000000025B7:
	mov	eax,0h

l00000000000025BC:
	mov	[rbp-8h],rax
	mov	dword ptr [rbp-0Ch],0Eh
	jmp	25E6h

l00000000000025C9:
	shl	qword ptr [rbp-8h],1h
	mov	eax,[rbp-0Ch]
	mov	edx,[rbp-14h]
	mov	ecx,eax
	shr	edx,cl
	mov	eax,edx
	mov	eax,eax
	and	eax,1h
	or	[rbp-8h],rax
	sub	dword ptr [rbp-0Ch],1h

l00000000000025E6:
	cmp	dword ptr [rbp-0Ch],0h
	jns	25C9h

l00000000000025EC:
	mov	rax,[rbp-8h]
	leave
	ret

;; longIntToRegister: 00000000000025F2
;;   Called from:
;;     00000000000031FD (in sub_f)
;;     0000000000003266 (in sub_f)
;;     000000000000329F (in sub_f)
;;     000000000000335D (in sub_f)
;;     000000000000355E (in mul_f)
;;     0000000000003813 (in div_f)
;;     000000000000502F (in callscanfd_f)
longIntToRegister proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,8h
	call	[0000000000008FD0]                                    ; [rip+000069CC]
	mov	[rbp-8h],rdi
	mov	rax,[rbp-8h]
	movzx	eax,ax
	leave
	ret

;; shiftr_f: 0000000000002611
shiftr_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+000069AD]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00006CC8]
	lea	edx,[rax+1h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	2695h

l0000000000002651:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	2695h

l0000000000002659:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	2695h

l0000000000002661:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	2695h

l0000000000002669:
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00006C69]
	lea	rsi,[0000000000006170]                                 ; [rip+00003AF2]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	271Ch

l0000000000002695:
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006C53]
	mov	eax,[rdx+rax]
	and	eax,1h
	mov	edi,eax
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006C1A]
	mov	edx,[rdx+rax]
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	mov	ecx,edx
	shr	ecx,1h
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006BFB]
	mov	[rdx+rax],ecx
	mov	eax,[0000000000009300]                                 ; [rip+00006BF2]
	add	eax,2h
	mov	[0000000000009300],eax                                 ; [rip+00006BE9]
	mov	eax,1h

l000000000000271C:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	2730h

l000000000000272B:
	call	2170h

l0000000000002730:
	leave
	ret

;; shiftl_f: 0000000000002732
shiftl_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+0000688C]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00006BA7]
	lea	edx,[rax+1h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	27B6h

l0000000000002772:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	27B6h

l000000000000277A:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	27B6h

l0000000000002782:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	27B6h

l000000000000278A:
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00006B48]
	lea	rsi,[00000000000061A8]                                 ; [rip+00003A09]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	2842h

l00000000000027B6:
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006B32]
	mov	eax,[rdx+rax]
	and	eax,8000h
	mov	edi,eax
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006AF7]
	mov	eax,[rdx+rax]
	lea	ecx,[rax+rax]
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	movzx	eax,cx
	movsxd	rdx,edx
	lea	rcx,[0000h+rdx*4]
	lea	rdx,[0000000000009300]                                 ; [rip+00006AD5]
	mov	[rcx+rdx],eax
	mov	eax,[0000000000009300]                                 ; [rip+00006ACC]
	add	eax,2h
	mov	[0000000000009300],eax                                 ; [rip+00006AC3]
	mov	eax,1h

l0000000000002842:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	2856h

l0000000000002851:
	call	2170h

l0000000000002856:
	leave
	ret

;; and_f: 0000000000002858
and_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00006766]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00006A81]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Ah]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+00006A6A]
	lea	edx,[rax+2h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,4h
	jz	28C7h

l00000000000028AF:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,5h
	jz	28C7h

l00000000000028B7:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,6h
	jz	28C7h

l00000000000028BF:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,7h
	jnz	28E7h

l00000000000028C7:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	291Ah

l00000000000028CF:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	291Ah

l00000000000028D7:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	291Ah

l00000000000028DF:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	291Ah

l00000000000028E7:
	movzx	eax,byte ptr [rbp-9h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+000069E4]
	lea	rsi,[00000000000061E0]                                 ; [rip+000038DD]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	299Fh

l000000000000291A:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000069B0]
	mov	ecx,[rdx+rax]
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006995]
	mov	edx,[rdx+rax]
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	eax,al
	and	ecx,edx
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006978]
	mov	[rdx+rax],ecx
	mov	eax,[0000000000009300]                                 ; [rip+0000696F]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+00006966]
	mov	eax,1h

l000000000000299F:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	29B3h

l00000000000029AE:
	call	2170h

l00000000000029B3:
	leave
	ret

;; or_f: 00000000000029B5
or_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00006609]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00006924]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Ah]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+0000690D]
	lea	edx,[rax+2h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,4h
	jz	2A24h

l0000000000002A0C:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,5h
	jz	2A24h

l0000000000002A14:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,6h
	jz	2A24h

l0000000000002A1C:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,7h
	jnz	2A44h

l0000000000002A24:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	2A77h

l0000000000002A2C:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	2A77h

l0000000000002A34:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	2A77h

l0000000000002A3C:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	2A77h

l0000000000002A44:
	movzx	eax,byte ptr [rbp-9h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00006887]
	lea	rsi,[0000000000006218]                                 ; [rip+000037B8]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	2AFCh

l0000000000002A77:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006853]
	mov	ecx,[rdx+rax]
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006838]
	mov	edx,[rdx+rax]
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	eax,al
	or	ecx,edx
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+0000681B]
	mov	[rdx+rax],ecx
	mov	eax,[0000000000009300]                                 ; [rip+00006812]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+00006809]
	mov	eax,1h

l0000000000002AFC:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	2B10h

l0000000000002B0B:
	call	2170h

l0000000000002B10:
	leave
	ret

;; xor_f: 0000000000002B12
xor_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+000064AC]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+000067C7]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Ah]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+000067B0]
	lea	edx,[rax+2h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,4h
	jz	2B81h

l0000000000002B69:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,5h
	jz	2B81h

l0000000000002B71:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,6h
	jz	2B81h

l0000000000002B79:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,7h
	jnz	2BA1h

l0000000000002B81:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	2BD4h

l0000000000002B89:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	2BD4h

l0000000000002B91:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	2BD4h

l0000000000002B99:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	2BD4h

l0000000000002BA1:
	movzx	eax,byte ptr [rbp-9h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+0000672A]
	lea	rsi,[0000000000006250]                                 ; [rip+00003693]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	2C59h

l0000000000002BD4:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000066F6]
	mov	ecx,[rdx+rax]
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000066DB]
	mov	edx,[rdx+rax]
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	eax,al
	xor	ecx,edx
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000066BE]
	mov	[rdx+rax],ecx
	mov	eax,[0000000000009300]                                 ; [rip+000066B5]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+000066AC]
	mov	eax,1h

l0000000000002C59:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	2C6Dh

l0000000000002C68:
	call	2170h

l0000000000002C6D:
	leave
	ret

;; not_f: 0000000000002C6F
not_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+0000634F]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+0000666A]
	lea	edx,[rax+1h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	2CF0h

l0000000000002CAF:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	2CF0h

l0000000000002CB7:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	2CF0h

l0000000000002CBF:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	2CF0h

l0000000000002CC7:
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+0000660B]
	lea	rsi,[0000000000006288]                                 ; [rip+000035AC]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	2D5Ch

l0000000000002CF0:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2419h
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000065E4]
	mov	edx,[rdx+rax]
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	mov	ecx,edx
	not	ecx
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000065C5]
	mov	[rdx+rax],ecx
	mov	edi,0h
	call	2489h
	mov	eax,[0000000000009300]                                 ; [rip+000065B2]
	add	eax,2h
	mov	[0000000000009300],eax                                 ; [rip+000065A9]
	mov	eax,1h

l0000000000002D5C:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	2D70h

l0000000000002D6B:
	call	2170h

l0000000000002D70:
	leave
	ret

;; add_internal: 0000000000002D72
;;   Called from:
;;     0000000000003014 (in add_f)
;;     000000000000321F (in sub_f)
;;     0000000000003288 (in sub_f)
;;     0000000000003306 (in sub_f)
;;     00000000000033C4 (in sub_f)
add_internal proc
	endbr64
	push	rbp
	mov	rbp,rsp
	push	rbx
	sub	rsp,38h
	call	[0000000000008FD0]                                    ; [rip+0000624B]
	mov	[rbp-20h],rdi
	mov	[rbp-28h],rsi
	mov	[rbp-30h],rdx
	mov	[rbp-38h],rcx
	mov	[rbp-40h],r8
	mov	dword ptr [rbp-18h],0h
	mov	dword ptr [rbp-14h],0h
	mov	dword ptr [rbp-10h],0h
	jmp	2E22h

l0000000000002DB0:
	mov	rax,[rbp-20h]
	mov	edx,[rax]
	mov	eax,[rbp-10h]
	mov	esi,edx
	mov	ecx,eax
	shr	esi,cl
	mov	rax,[rbp-28h]
	mov	edx,[rax]
	mov	eax,[rbp-10h]
	mov	ecx,eax
	shr	edx,cl
	mov	eax,edx
	xor	eax,esi
	and	eax,1h
	xor	eax,[rbp-18h]
	mov	edx,eax
	mov	eax,[rbp-10h]
	mov	ecx,eax
	shl	edx,cl
	mov	eax,edx
	or	[rbp-14h],eax
	mov	rax,[rbp-20h]
	mov	edx,[rax]
	mov	eax,[rbp-10h]
	mov	ecx,eax
	shr	edx,cl
	mov	eax,edx
	and	eax,1h
	mov	esi,eax
	mov	rax,[rbp-28h]
	mov	edx,[rax]
	mov	eax,[rbp-10h]
	mov	ecx,eax
	shr	edx,cl
	mov	eax,edx
	and	eax,1h
	lea	edx,[rsi+rax]
	mov	eax,[rbp-18h]
	add	eax,edx
	cmp	eax,1h
	seta	al
	movzx	eax,al
	mov	[rbp-18h],eax
	add	dword ptr [rbp-10h],1h

l0000000000002E22:
	cmp	dword ptr [rbp-10h],0Fh
	jbe	2DB0h

l0000000000002E28:
	mov	rax,[rbp-20h]
	mov	eax,[rax]
	mov	edi,eax
	call	255Ch
	mov	ebx,eax
	mov	rax,[rbp-28h]
	mov	eax,[rax]
	mov	edi,eax
	call	255Ch
	cmp	ebx,eax
	jnz	2EB1h

l0000000000002E48:
	mov	rax,[rbp-20h]
	mov	eax,[rax]
	mov	edi,eax
	call	255Ch
	mov	ebx,eax
	mov	eax,[rbp-14h]
	mov	edi,eax
	call	255Ch
	cmp	ebx,eax
	jz	2E71h

l0000000000002E65:
	mov	rax,[rbp-40h]
	mov	dword ptr [rax],1h
	jmp	2EBBh

l0000000000002E71:
	mov	rax,[rbp-20h]
	mov	eax,[rax]
	shr	eax,0Fh
	mov	edx,eax
	mov	rax,[rbp-28h]
	mov	eax,[rax]
	shr	eax,0Fh
	xor	edx,eax
	mov	eax,[rbp-14h]
	shr	eax,0Fh
	xor	eax,edx
	and	eax,1h
	test	eax,eax
	setnz	al
	movzx	eax,al
	mov	[rbp-0Ch],eax
	mov	eax,[rbp-0Ch]
	cmp	eax,[rbp-18h]
	setnz	al
	movzx	edx,al
	mov	rax,[rbp-40h]
	mov	[rax],edx
	jmp	2EBBh

l0000000000002EB1:
	mov	rax,[rbp-40h]
	mov	dword ptr [rax],0h

l0000000000002EBB:
	mov	edx,[rbp-18h]
	mov	rax,[rbp-30h]
	mov	[rax],edx
	cmp	dword ptr [rbp-14h],0h
	setz	al
	movzx	edx,al
	mov	rax,[rbp-38h]
	mov	[rax],edx
	mov	rax,[rbp-20h]
	mov	edx,[rbp-14h]
	mov	[rax],edx
	nop
	add	rsp,38h
	pop	rbx
	pop	rbp
	ret

;; add_f: 0000000000002EE5
add_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,20h
	call	[0000000000008FD0]                                    ; [rip+000060D9]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+000063F4]
	lea	edx,[rax+1h]
	lea	rax,[rbp-16h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+000063DD]
	lea	edx,[rax+2h]
	lea	rax,[rbp-15h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-16h]
	cmp	al,4h
	jz	2F64h

l0000000000002F3C:
	movzx	eax,byte ptr [rbp-16h]
	cmp	al,5h
	jz	2F64h

l0000000000002F44:
	movzx	eax,byte ptr [rbp-16h]
	cmp	al,6h
	jz	2F64h

l0000000000002F4C:
	movzx	eax,byte ptr [rbp-16h]
	cmp	al,7h
	jz	2F64h

l0000000000002F54:
	movzx	eax,byte ptr [rbp-16h]
	cmp	al,2h
	jz	2F64h

l0000000000002F5C:
	movzx	eax,byte ptr [rbp-16h]
	cmp	al,3h
	jnz	2F94h

l0000000000002F64:
	movzx	eax,byte ptr [rbp-15h]
	cmp	al,4h
	jz	2FC7h

l0000000000002F6C:
	movzx	eax,byte ptr [rbp-15h]
	cmp	al,5h
	jz	2FC7h

l0000000000002F74:
	movzx	eax,byte ptr [rbp-15h]
	cmp	al,6h
	jz	2FC7h

l0000000000002F7C:
	movzx	eax,byte ptr [rbp-15h]
	cmp	al,7h
	jz	2FC7h

l0000000000002F84:
	movzx	eax,byte ptr [rbp-15h]
	cmp	al,2h
	jz	2FC7h

l0000000000002F8C:
	movzx	eax,byte ptr [rbp-15h]
	cmp	al,3h
	jz	2FC7h

l0000000000002F94:
	movzx	eax,byte ptr [rbp-15h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-16h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00006337]
	lea	rsi,[00000000000062B8]                                 ; [rip+00003308]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	304Bh

l0000000000002FC7:
	movzx	eax,byte ptr [rbp-15h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006321]
	lea	rsi,[rdx+rax]
	movzx	eax,byte ptr [rbp-16h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006305]
	lea	rdi,[rdx+rax]
	lea	rcx,[rbp-0Ch]
	lea	rdx,[rbp-10h]
	lea	rax,[rbp-14h]
	mov	r8,rcx
	mov	rcx,rdx
	mov	rdx,rax
	call	2D72h
	mov	eax,[rbp-14h]
	mov	edi,eax
	call	23A9h
	mov	eax,[rbp-10h]
	mov	edi,eax
	call	2489h
	mov	eax,[rbp-0Ch]
	mov	edi,eax
	call	2419h
	mov	eax,[0000000000009300]                                 ; [rip+000062C3]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+000062BA]
	mov	eax,1h

l000000000000304B:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	305Fh

l000000000000305A:
	call	2170h

l000000000000305F:
	leave
	ret

;; sub_f: 0000000000003061
sub_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	push	rbx
	sub	rsp,38h
	call	[0000000000008FD0]                                    ; [rip+00005F5C]
	mov	rax,fs:[0028h]
	mov	[rbp-18h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00006277]
	lea	edx,[rax+1h]
	lea	rax,[rbp-32h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+00006260]
	lea	edx,[rax+2h]
	lea	rax,[rbp-31h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-32h]
	cmp	al,4h
	jz	30E1h

l00000000000030B9:
	movzx	eax,byte ptr [rbp-32h]
	cmp	al,5h
	jz	30E1h

l00000000000030C1:
	movzx	eax,byte ptr [rbp-32h]
	cmp	al,6h
	jz	30E1h

l00000000000030C9:
	movzx	eax,byte ptr [rbp-32h]
	cmp	al,7h
	jz	30E1h

l00000000000030D1:
	movzx	eax,byte ptr [rbp-32h]
	cmp	al,2h
	jz	30E1h

l00000000000030D9:
	movzx	eax,byte ptr [rbp-32h]
	cmp	al,3h
	jnz	3111h

l00000000000030E1:
	movzx	eax,byte ptr [rbp-31h]
	cmp	al,4h
	jz	3144h

l00000000000030E9:
	movzx	eax,byte ptr [rbp-31h]
	cmp	al,5h
	jz	3144h

l00000000000030F1:
	movzx	eax,byte ptr [rbp-31h]
	cmp	al,6h
	jz	3144h

l00000000000030F9:
	movzx	eax,byte ptr [rbp-31h]
	cmp	al,7h
	jz	3144h

l0000000000003101:
	movzx	eax,byte ptr [rbp-31h]
	cmp	al,2h
	jz	3144h

l0000000000003109:
	movzx	eax,byte ptr [rbp-31h]
	cmp	al,3h
	jz	3144h

l0000000000003111:
	movzx	eax,byte ptr [rbp-31h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-32h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+000061BA]
	lea	rsi,[00000000000062F0]                                 ; [rip+000031C3]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	3419h

l0000000000003144:
	movzx	eax,byte ptr [rbp-31h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000061A4]
	mov	eax,[rdx+rax]
	mov	[rbp-1Ch],eax
	movzx	eax,byte ptr [rbp-31h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006186]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	cmp	rax,-8000h
	jnz	332Eh

l0000000000003190:
	movzx	eax,byte ptr [rbp-32h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006158]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	test	rax,rax
	js	31DAh

l00000000000031B7:
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	23A9h
	mov	edi,1h
	call	2419h
	jmp	33E7h

l00000000000031DA:
	movzx	eax,byte ptr [rbp-32h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+0000610E]
	mov	eax,[rdx+rax]
	mov	[rbp-30h],eax
	mov	edi,1h
	call	25F2h
	mov	[rbp-2Ch],eax
	lea	rdi,[rbp-20h]
	lea	rcx,[rbp-28h]
	lea	rdx,[rbp-24h]
	lea	rsi,[rbp-2Ch]
	lea	rax,[rbp-30h]
	mov	r8,rdi
	mov	rdi,rax
	call	2D72h
	movzx	eax,byte ptr [rbp-32h]
	movzx	edx,al
	mov	eax,[rbp-30h]
	movsxd	rdx,edx
	lea	rcx,[0000h+rdx*4]
	lea	rdx,[0000000000009300]                                 ; [rip+000060C0]
	mov	[rcx+rdx],eax
	movzx	eax,byte ptr [rbp-31h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000060A5]
	mov	eax,[rdx+rax]
	mov	[rbp-30h],eax
	mov	edi,1h
	call	25F2h
	mov	[rbp-2Ch],eax
	lea	rdi,[rbp-20h]
	lea	rcx,[rbp-28h]
	lea	rdx,[rbp-24h]
	lea	rsi,[rbp-2Ch]
	lea	rax,[rbp-30h]
	mov	r8,rdi
	mov	rdi,rax
	call	2D72h
	mov	eax,[rbp-30h]
	mov	eax,eax
	neg	rax
	movzx	edx,byte ptr [rbp-31h]
	movzx	ebx,dl
	mov	rdi,rax
	call	25F2h
	movsxd	rdx,ebx
	lea	rcx,[0000h+rdx*4]
	lea	rdx,[0000000000009300]                                 ; [rip+0000604A]
	mov	[rcx+rdx],eax
	movzx	eax,byte ptr [rbp-31h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+0000602F]
	lea	rsi,[rdx+rax]
	movzx	eax,byte ptr [rbp-32h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00006013]
	lea	rdi,[rdx+rax]
	lea	rcx,[rbp-20h]
	lea	rdx,[rbp-28h]
	lea	rax,[rbp-24h]
	mov	r8,rcx
	mov	rcx,rdx
	mov	rdx,rax
	call	2D72h
	mov	eax,[rbp-24h]
	mov	edi,eax
	call	23A9h
	mov	eax,[rbp-28h]
	mov	edi,eax
	call	2489h
	mov	eax,[rbp-20h]
	mov	edi,eax
	call	2419h
	jmp	33E7h

l000000000000332E:
	movzx	eax,byte ptr [rbp-31h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005FBA]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	neg	rax
	movzx	edx,byte ptr [rbp-31h]
	movzx	ebx,dl
	mov	rdi,rax
	call	25F2h
	movsxd	rdx,ebx
	lea	rcx,[0000h+rdx*4]
	lea	rdx,[0000000000009300]                                 ; [rip+00005F8C]
	mov	[rcx+rdx],eax
	movzx	eax,byte ptr [rbp-31h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005F71]
	lea	rsi,[rdx+rax]
	movzx	eax,byte ptr [rbp-32h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005F55]
	lea	rdi,[rdx+rax]
	lea	rcx,[rbp-20h]
	lea	rdx,[rbp-28h]
	lea	rax,[rbp-24h]
	mov	r8,rcx
	mov	rcx,rdx
	mov	rdx,rax
	call	2D72h
	mov	eax,[rbp-24h]
	mov	edi,eax
	call	23A9h
	mov	eax,[rbp-28h]
	mov	edi,eax
	call	2489h
	mov	eax,[rbp-20h]
	mov	edi,eax
	call	2419h

l00000000000033E7:
	movzx	eax,byte ptr [rbp-31h]
	movzx	eax,al
	cdqe
	lea	rcx,[0000h+rax*4]
	lea	rdx,[0000000000009300]                                 ; [rip+00005F01]
	mov	eax,[rbp-1Ch]
	mov	[rcx+rdx],eax
	mov	eax,[0000000000009300]                                 ; [rip+00005EF5]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+00005EEC]
	mov	eax,1h

l0000000000003419:
	mov	rbx,[rbp-18h]
	xor	rbx,fs:[0028h]
	jz	342Dh

l0000000000003428:
	call	2170h

l000000000000342D:
	add	rsp,38h
	pop	rbx
	pop	rbp
	ret

;; mul_f: 0000000000003434
mul_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	push	rbx
	sub	rsp,28h
	call	[0000000000008FD0]                                    ; [rip+00005B89]
	mov	rax,fs:[0028h]
	mov	[rbp-18h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00005EA4]
	lea	edx,[rax+1h]
	lea	rax,[rbp-2Ah]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+00005E8D]
	lea	edx,[rax+2h]
	lea	rax,[rbp-29h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-2Ah]
	cmp	al,4h
	jz	34A4h

l000000000000348C:
	movzx	eax,byte ptr [rbp-2Ah]
	cmp	al,5h
	jz	34A4h

l0000000000003494:
	movzx	eax,byte ptr [rbp-2Ah]
	cmp	al,6h
	jz	34A4h

l000000000000349C:
	movzx	eax,byte ptr [rbp-2Ah]
	cmp	al,7h
	jnz	34C4h

l00000000000034A4:
	movzx	eax,byte ptr [rbp-29h]
	cmp	al,4h
	jz	34F7h

l00000000000034AC:
	movzx	eax,byte ptr [rbp-29h]
	cmp	al,5h
	jz	34F7h

l00000000000034B4:
	movzx	eax,byte ptr [rbp-29h]
	cmp	al,6h
	jz	34F7h

l00000000000034BC:
	movzx	eax,byte ptr [rbp-29h]
	cmp	al,7h
	jz	34F7h

l00000000000034C4:
	movzx	eax,byte ptr [rbp-29h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-2Ah]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00005E07]
	lea	rsi,[0000000000006328]                                 ; [rip+00002E48]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	35CFh

l00000000000034F7:
	movzx	eax,byte ptr [rbp-2Ah]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005DF1]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	mov	[rbp-28h],rax
	movzx	eax,byte ptr [rbp-29h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005DCB]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	mov	[rbp-20h],rax
	mov	rax,[rbp-28h]
	imul	rax,[rbp-20h]
	mov	[rbp-28h],rax
	movzx	eax,byte ptr [rbp-2Ah]
	movzx	ebx,al
	mov	rax,[rbp-28h]
	mov	rdi,rax
	call	25F2h
	movsxd	rdx,ebx
	lea	rcx,[0000h+rdx*4]
	lea	rdx,[0000000000009300]                                 ; [rip+00005D8B]
	mov	[rcx+rdx],eax
	mov	edi,0h
	call	23A9h
	cmp	qword ptr [rbp-28h],0h
	setz	al
	movzx	eax,al
	mov	edi,eax
	call	2489h
	cmp	qword ptr [rbp-28h],-8000h
	jl	35A8h

l000000000000359E:
	cmp	qword ptr [rbp-28h],+7FFFh
	jle	35AFh

l00000000000035A8:
	mov	eax,1h
	jmp	35B4h

l00000000000035AF:
	mov	eax,0h

l00000000000035B4:
	mov	edi,eax
	call	2419h
	mov	eax,[0000000000009300]                                 ; [rip+00005D3F]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+00005D36]
	mov	eax,1h

l00000000000035CF:
	mov	rbx,[rbp-18h]
	xor	rbx,fs:[0028h]
	jz	35E3h

l00000000000035DE:
	call	2170h

l00000000000035E3:
	add	rsp,28h
	pop	rbx
	pop	rbp
	ret

;; div_f: 00000000000035EA
div_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	push	rbx
	sub	rsp,28h
	call	[0000000000008FD0]                                    ; [rip+000059D3]
	mov	rax,fs:[0028h]
	mov	[rbp-18h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00005CEE]
	lea	edx,[rax+1h]
	lea	rax,[rbp-2Eh]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+00005CD7]
	lea	edx,[rax+2h]
	lea	rax,[rbp-2Dh]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-2Eh]
	cmp	al,4h
	jz	365Ah

l0000000000003642:
	movzx	eax,byte ptr [rbp-2Eh]
	cmp	al,5h
	jz	365Ah

l000000000000364A:
	movzx	eax,byte ptr [rbp-2Eh]
	cmp	al,6h
	jz	365Ah

l0000000000003652:
	movzx	eax,byte ptr [rbp-2Eh]
	cmp	al,7h
	jnz	367Ah

l000000000000365A:
	movzx	eax,byte ptr [rbp-2Dh]
	cmp	al,4h
	jz	36ADh

l0000000000003662:
	movzx	eax,byte ptr [rbp-2Dh]
	cmp	al,5h
	jz	36ADh

l000000000000366A:
	movzx	eax,byte ptr [rbp-2Dh]
	cmp	al,6h
	jz	36ADh

l0000000000003672:
	movzx	eax,byte ptr [rbp-2Dh]
	cmp	al,7h
	jz	36ADh

l000000000000367A:
	movzx	eax,byte ptr [rbp-2Dh]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-2Eh]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00005C51]
	lea	rsi,[0000000000006360]                                 ; [rip+00002CCA]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	3873h

l00000000000036AD:
	movzx	eax,byte ptr [rbp-2Eh]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005C3B]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	255Ch
	mov	ebx,eax
	movzx	eax,byte ptr [rbp-2Dh]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005C17]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	255Ch
	cmp	ebx,eax
	setz	al
	movzx	eax,al
	mov	[rbp-2Ch],eax
	movzx	eax,byte ptr [rbp-2Eh]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005BEA]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	test	rax,rax
	js	3749h

l0000000000003725:
	movzx	eax,byte ptr [rbp-2Eh]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005BC3]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	jmp	376Eh

l0000000000003749:
	movzx	eax,byte ptr [rbp-2Eh]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005B9F]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	neg	rax

l000000000000376E:
	mov	[rbp-28h],rax
	movzx	eax,byte ptr [rbp-2Dh]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005B76]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	test	rax,rax
	js	37BDh

l0000000000003799:
	movzx	eax,byte ptr [rbp-2Dh]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005B4F]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	jmp	37E2h

l00000000000037BD:
	movzx	eax,byte ptr [rbp-2Dh]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005B2B]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	neg	rax

l00000000000037E2:
	mov	[rbp-20h],rax
	cmp	qword ptr [rbp-20h],0h
	jz	3839h

l00000000000037ED:
	mov	rax,[rbp-28h]
	cqo
	idiv	qword ptr [rbp-20h]
	mov	[rbp-28h],rax
	cmp	dword ptr [rbp-2Ch],0h
	jnz	3805h

l0000000000003801:
	neg	qword ptr [rbp-28h]

l0000000000003805:
	movzx	eax,byte ptr [rbp-2Eh]
	movzx	ebx,al
	mov	rax,[rbp-28h]
	mov	rdi,rax
	call	25F2h
	movsxd	rdx,ebx
	lea	rcx,[0000h+rdx*4]
	lea	rdx,[0000000000009300]                                 ; [rip+00005AD6]
	mov	[rcx+rdx],eax
	mov	edi,0h
	call	2419h
	jmp	3843h

l0000000000003839:
	mov	edi,1h
	call	2419h

l0000000000003843:
	mov	edi,0h
	call	23A9h
	cmp	qword ptr [rbp-28h],0h
	setz	al
	movzx	eax,al
	mov	edi,eax
	call	2489h
	mov	eax,[0000000000009300]                                 ; [rip+00005A9B]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+00005A92]
	mov	eax,1h

l0000000000003873:
	mov	rsi,[rbp-18h]
	xor	rsi,fs:[0028h]
	jz	3887h

l0000000000003882:
	call	2170h

l0000000000003887:
	add	rsp,28h
	pop	rbx
	pop	rbp
	ret

;; cp_f: 000000000000388E
cp_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00005730]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00005A4B]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Ah]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+00005A34]
	lea	edx,[rax+2h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,4h
	jz	390Dh

l00000000000038E5:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,5h
	jz	390Dh

l00000000000038ED:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,6h
	jz	390Dh

l00000000000038F5:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,7h
	jz	390Dh

l00000000000038FD:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,2h
	jz	390Dh

l0000000000003905:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,3h
	jnz	393Dh

l000000000000390D:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	396Dh

l0000000000003915:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	396Dh

l000000000000391D:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	396Dh

l0000000000003925:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	396Dh

l000000000000392D:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,2h
	jz	396Dh

l0000000000003935:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,3h
	jz	396Dh

l000000000000393D:
	movzx	eax,byte ptr [rbp-9h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+0000598E]
	lea	rsi,[0000000000006398]                                 ; [rip+00002A3F]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	39D6h

l000000000000396D:
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	movzx	edx,byte ptr [rbp-0Ah]
	movzx	edx,dl
	cdqe
	lea	rcx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005974]
	mov	eax,[rcx+rax]
	movsxd	rdx,edx
	lea	rcx,[0000h+rdx*4]
	lea	rdx,[0000000000009300]                                 ; [rip+0000595F]
	mov	[rcx+rdx],eax
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	mov	eax,[0000000000009300]                                 ; [rip+00005938]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+0000592F]
	mov	eax,1h

l00000000000039D6:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	39EAh

l00000000000039E5:
	call	2170h

l00000000000039EA:
	leave
	ret

;; loadw_f: 00000000000039EC
loadw_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+000055D2]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+000058ED]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Ah]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+000058D6]
	lea	edx,[rax+2h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,4h
	jz	3A6Bh

l0000000000003A43:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,5h
	jz	3A6Bh

l0000000000003A4B:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,6h
	jz	3A6Bh

l0000000000003A53:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,7h
	jz	3A6Bh

l0000000000003A5B:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,2h
	jz	3A6Bh

l0000000000003A63:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,3h
	jnz	3A9Bh

l0000000000003A6B:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	3ACBh

l0000000000003A73:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	3ACBh

l0000000000003A7B:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	3ACBh

l0000000000003A83:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	3ACBh

l0000000000003A8B:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,2h
	jz	3ACBh

l0000000000003A93:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,3h
	jz	3ACBh

l0000000000003A9B:
	movzx	eax,byte ptr [rbp-9h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00005830]
	lea	rsi,[00000000000063D0]                                 ; [rip+00002919]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	3B3Dh

l0000000000003ACB:
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+0000581D]
	add	rdx,rax
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rcx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005802]
	mov	eax,[rcx+rax]
	mov	rsi,rdx
	mov	edi,eax
	call	5A8Dh
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	mov	eax,[0000000000009300]                                 ; [rip+000057D1]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+000057C8]
	mov	eax,1h

l0000000000003B3D:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	3B51h

l0000000000003B4C:
	call	2170h

l0000000000003B51:
	leave
	ret

;; storew_f: 0000000000003B53
storew_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+0000546B]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00005786]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Ah]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+0000576F]
	lea	edx,[rax+2h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,4h
	jz	3BD2h

l0000000000003BAA:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,5h
	jz	3BD2h

l0000000000003BB2:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,6h
	jz	3BD2h

l0000000000003BBA:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,7h
	jz	3BD2h

l0000000000003BC2:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,2h
	jz	3BD2h

l0000000000003BCA:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,3h
	jnz	3C02h

l0000000000003BD2:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	3C32h

l0000000000003BDA:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	3C32h

l0000000000003BE2:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	3C32h

l0000000000003BEA:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	3C32h

l0000000000003BF2:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,2h
	jz	3C32h

l0000000000003BFA:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,3h
	jz	3C32h

l0000000000003C02:
	movzx	eax,byte ptr [rbp-9h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+000056C9]
	lea	rsi,[0000000000006410]                                 ; [rip+000027F2]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	3CA3h

l0000000000003C32:
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000056B6]
	mov	edx,[rdx+rax]
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rcx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+0000569B]
	mov	eax,[rcx+rax]
	mov	esi,edx
	mov	edi,eax
	call	5B1Ch
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	mov	eax,[0000000000009300]                                 ; [rip+0000566B]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+00005662]
	mov	eax,1h

l0000000000003CA3:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	3CB7h

l0000000000003CB2:
	call	2170h

l0000000000003CB7:
	leave
	ret

;; loadb_f: 0000000000003CB9
loadb_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00005305]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00005620]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Ah]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+00005609]
	lea	edx,[rax+2h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,4h
	jz	3D38h

l0000000000003D10:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,5h
	jz	3D38h

l0000000000003D18:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,6h
	jz	3D38h

l0000000000003D20:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,7h
	jz	3D38h

l0000000000003D28:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,2h
	jz	3D38h

l0000000000003D30:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,3h
	jnz	3D68h

l0000000000003D38:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	3D98h

l0000000000003D40:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	3D98h

l0000000000003D48:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	3D98h

l0000000000003D50:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	3D98h

l0000000000003D58:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,2h
	jz	3D98h

l0000000000003D60:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,3h
	jz	3D98h

l0000000000003D68:
	movzx	eax,byte ptr [rbp-9h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00005563]
	lea	rsi,[0000000000006450]                                 ; [rip+000026CC]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	3E16h

l0000000000003D98:
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005550]
	mov	eax,[rdx+rax]
	lea	rdx,[rbp-0Bh]
	mov	rsi,rdx
	mov	edi,eax
	call	59C9h
	movzx	eax,byte ptr [rbp-0Bh]
	movzx	edx,byte ptr [rbp-0Ah]
	movzx	edx,dl
	movzx	eax,al
	movsxd	rdx,edx
	lea	rcx,[0000h+rdx*4]
	lea	rdx,[0000000000009300]                                 ; [rip+0000551F]
	mov	[rcx+rdx],eax
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	mov	eax,[0000000000009300]                                 ; [rip+000054F8]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+000054EF]
	mov	eax,1h

l0000000000003E16:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	3E2Ah

l0000000000003E25:
	call	2170h

l0000000000003E2A:
	leave
	ret

;; storeb_f: 0000000000003E2C
storeb_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00005192]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+000054AD]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Ah]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+00005496]
	lea	edx,[rax+2h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,4h
	jz	3EABh

l0000000000003E83:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,5h
	jz	3EABh

l0000000000003E8B:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,6h
	jz	3EABh

l0000000000003E93:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,7h
	jz	3EABh

l0000000000003E9B:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,2h
	jz	3EABh

l0000000000003EA3:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,3h
	jnz	3EDBh

l0000000000003EAB:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	3F0Bh

l0000000000003EB3:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	3F0Bh

l0000000000003EBB:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	3F0Bh

l0000000000003EC3:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	3F0Bh

l0000000000003ECB:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,2h
	jz	3F0Bh

l0000000000003ED3:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,3h
	jz	3F0Bh

l0000000000003EDB:
	movzx	eax,byte ptr [rbp-9h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+000053F0]
	lea	rsi,[0000000000006490]                                 ; [rip+00002599]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	3F7Fh

l0000000000003F0B:
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000053DD]
	mov	eax,[rdx+rax]
	movzx	edx,al
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rcx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000053BF]
	mov	eax,[rcx+rax]
	mov	esi,edx
	mov	edi,eax
	call	5A2Ch
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	mov	eax,[0000000000009300]                                 ; [rip+0000538F]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+00005386]
	mov	eax,1h

l0000000000003F7F:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	3F93h

l0000000000003F8E:
	call	2170h

l0000000000003F93:
	leave
	ret

;; const_f: 0000000000003F95
const_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00005029]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00005344]
	lea	edx,[rax+1h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	4029h

l0000000000003FD5:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	4029h

l0000000000003FDD:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	4029h

l0000000000003FE5:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	4029h

l0000000000003FED:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,2h
	jz	4029h

l0000000000003FF5:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,3h
	jz	4029h

l0000000000003FFD:
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+000052D5]
	lea	rsi,[00000000000064D0]                                 ; [rip+000024BE]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	40D5h

l0000000000004029:
	mov	eax,[0000000000009300]                                 ; [rip+000052D1]
	and	eax,1h
	test	eax,eax
	jnz	4075h

l0000000000004036:
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000052B2]
	add	rdx,rax
	mov	eax,[0000000000009300]                                 ; [rip+000052A9]
	add	eax,2h
	mov	rsi,rdx
	mov	edi,eax
	call	5A8Dh
	mov	eax,[0000000000009300]                                 ; [rip+00005296]
	add	eax,4h
	mov	[0000000000009300],eax                                 ; [rip+0000528D]
	jmp	40B2h

l0000000000004075:
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005273]
	add	rdx,rax
	mov	eax,[0000000000009300]                                 ; [rip+0000526A]
	add	eax,3h
	mov	rsi,rdx
	mov	edi,eax
	call	5A8Dh
	mov	eax,[0000000000009300]                                 ; [rip+00005257]
	add	eax,5h
	mov	[0000000000009300],eax                                 ; [rip+0000524E]

l00000000000040B2:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	mov	eax,1h

l00000000000040D5:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	40E9h

l00000000000040E4:
	call	2170h

l00000000000040E9:
	leave
	ret

;; push_f: 00000000000040EB
push_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00004ED3]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+000051EE]
	lea	edx,[rax+1h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	417Ch

l000000000000412B:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	417Ch

l0000000000004133:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	417Ch

l000000000000413B:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	417Ch

l0000000000004143:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,3h
	jz	417Ch

l000000000000414B:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,2h
	jz	417Ch

l0000000000004153:
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+0000517F]
	lea	rsi,[0000000000006508]                                 ; [rip+000023A0]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	41EAh

l000000000000417C:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2419h
	mov	edi,0h
	call	2489h
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+0000514E]
	mov	eax,[rdx+rax]
	mov	edx,[0000000000009308]                                 ; [rip+0000514D]
	add	edx,2h
	mov	esi,eax
	mov	edi,edx
	call	5B1Ch
	mov	eax,[0000000000009308]                                 ; [rip+0000513B]
	add	eax,2h
	mov	[0000000000009308],eax                                 ; [rip+00005132]
	mov	eax,[0000000000009300]                                 ; [rip+00005124]
	add	eax,2h
	mov	[0000000000009300],eax                                 ; [rip+0000511B]
	mov	eax,1h

l00000000000041EA:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	41FEh

l00000000000041F9:
	call	2170h

l00000000000041FE:
	leave
	ret

;; pop_f: 0000000000004200
pop_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00004DBE]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+000050D9]
	lea	edx,[rax+1h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	4294h

l0000000000004240:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	4294h

l0000000000004248:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	4294h

l0000000000004250:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	4294h

l0000000000004258:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,3h
	jz	4294h

l0000000000004260:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,2h
	jz	4294h

l0000000000004268:
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+0000506A]
	lea	rsi,[0000000000006540]                                 ; [rip+000022C3]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	431Fh

l0000000000004294:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edx,[0000000000009308]                                 ; [rip+0000505A]
	mov	eax,[000000000000930C]                                 ; [rip+00005058]
	cmp	edx,eax
	jc	4301h

l00000000000042B8:
	mov	edi,0h
	call	2419h
	mov	eax,[0000000000009308]                                 ; [rip+00005040]
	sub	eax,2h
	mov	[0000000000009308],eax                                 ; [rip+00005037]
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00005017]
	add	rdx,rax
	mov	eax,[0000000000009308]                                 ; [rip+00005016]
	add	eax,2h
	mov	rsi,rdx
	mov	edi,eax
	call	5A8Dh
	jmp	430Bh

l0000000000004301:
	mov	edi,1h
	call	2419h

l000000000000430B:
	mov	eax,[0000000000009300]                                 ; [rip+00004FEF]
	add	eax,2h
	mov	[0000000000009300],eax                                 ; [rip+00004FE6]
	mov	eax,1h

l000000000000431F:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	4333h

l000000000000432E:
	call	2170h

l0000000000004333:
	leave
	ret

;; cmp_f: 0000000000004335
cmp_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00004C89]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00004FA4]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Ah]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+00004F8D]
	lea	edx,[rax+2h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,4h
	jz	43B4h

l000000000000438C:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,5h
	jz	43B4h

l0000000000004394:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,6h
	jz	43B4h

l000000000000439C:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,7h
	jz	43B4h

l00000000000043A4:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,2h
	jz	43B4h

l00000000000043AC:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,3h
	jnz	43E4h

l00000000000043B4:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	4417h

l00000000000043BC:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	4417h

l00000000000043C4:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	4417h

l00000000000043CC:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	4417h

l00000000000043D4:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,2h
	jz	4417h

l00000000000043DC:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,3h
	jz	4417h

l00000000000043E4:
	movzx	eax,byte ptr [rbp-9h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00004EE7]
	lea	rsi,[0000000000006570]                                 ; [rip+00002170]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	44E6h

l0000000000004417:
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004ED1]
	mov	edx,[rdx+rax]
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rcx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004EB6]
	mov	eax,[rcx+rax]
	cmp	edx,eax
	setz	al
	movzx	eax,al
	mov	edi,eax
	call	23A9h
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004E8C]
	mov	edx,[rdx+rax]
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rcx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004E71]
	mov	eax,[rcx+rax]
	cmp	edx,eax
	jnz	44BCh

l0000000000004496:
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004E52]
	mov	eax,[rdx+rax]
	test	eax,eax
	jnz	44BCh

l00000000000044B5:
	mov	eax,1h
	jmp	44C1h

l00000000000044BC:
	mov	eax,0h

l00000000000044C1:
	mov	edi,eax
	call	2489h
	mov	edi,0h
	call	2419h
	mov	eax,[0000000000009300]                                 ; [rip+00004E28]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+00004E1F]
	mov	eax,1h

l00000000000044E6:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	44FAh

l00000000000044F5:
	call	2170h

l00000000000044FA:
	leave
	ret

;; uless_f: 00000000000044FC
uless_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00004AC2]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00004DDD]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Ah]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+00004DC6]
	lea	edx,[rax+2h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,4h
	jz	457Bh

l0000000000004553:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,5h
	jz	457Bh

l000000000000455B:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,6h
	jz	457Bh

l0000000000004563:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,7h
	jz	457Bh

l000000000000456B:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,2h
	jz	457Bh

l0000000000004573:
	movzx	eax,byte ptr [rbp-0Ah]
	cmp	al,3h
	jnz	45ABh

l000000000000457B:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	45DBh

l0000000000004583:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	45DBh

l000000000000458B:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	45DBh

l0000000000004593:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	45DBh

l000000000000459B:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,2h
	jz	45DBh

l00000000000045A3:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,3h
	jz	45DBh

l00000000000045AB:
	movzx	eax,byte ptr [rbp-9h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00004D20]
	lea	rsi,[00000000000065A8]                                 ; [rip+00001FE1]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	4648h

l00000000000045DB:
	movzx	eax,byte ptr [rbp-0Ah]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004D0D]
	mov	edx,[rdx+rax]
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rcx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004CF2]
	mov	eax,[rcx+rax]
	cmp	edx,eax
	setc	al
	movzx	eax,al
	mov	edi,eax
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	mov	eax,[0000000000009300]                                 ; [rip+00004CC6]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+00004CBD]
	mov	eax,1h

l0000000000004648:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	465Ch

l0000000000004657:
	call	2170h

l000000000000465C:
	leave
	ret

;; sless_f: 000000000000465E
sless_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	push	rbx
	sub	rsp,18h
	call	[0000000000008FD0]                                    ; [rip+0000495F]
	mov	rax,fs:[0028h]
	mov	[rbp-18h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00004C7A]
	lea	edx,[rax+1h]
	lea	rax,[rbp-1Ah]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+00004C63]
	lea	edx,[rax+2h]
	lea	rax,[rbp-19h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-1Ah]
	cmp	al,4h
	jz	46DEh

l00000000000046B6:
	movzx	eax,byte ptr [rbp-1Ah]
	cmp	al,5h
	jz	46DEh

l00000000000046BE:
	movzx	eax,byte ptr [rbp-1Ah]
	cmp	al,6h
	jz	46DEh

l00000000000046C6:
	movzx	eax,byte ptr [rbp-1Ah]
	cmp	al,7h
	jz	46DEh

l00000000000046CE:
	movzx	eax,byte ptr [rbp-1Ah]
	cmp	al,2h
	jz	46DEh

l00000000000046D6:
	movzx	eax,byte ptr [rbp-1Ah]
	cmp	al,3h
	jnz	470Eh

l00000000000046DE:
	movzx	eax,byte ptr [rbp-19h]
	cmp	al,4h
	jz	473Eh

l00000000000046E6:
	movzx	eax,byte ptr [rbp-19h]
	cmp	al,5h
	jz	473Eh

l00000000000046EE:
	movzx	eax,byte ptr [rbp-19h]
	cmp	al,6h
	jz	473Eh

l00000000000046F6:
	movzx	eax,byte ptr [rbp-19h]
	cmp	al,7h
	jz	473Eh

l00000000000046FE:
	movzx	eax,byte ptr [rbp-19h]
	cmp	al,2h
	jz	473Eh

l0000000000004706:
	movzx	eax,byte ptr [rbp-19h]
	cmp	al,3h
	jz	473Eh

l000000000000470E:
	movzx	eax,byte ptr [rbp-19h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-1Ah]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00004BBD]
	lea	rsi,[00000000000065E8]                                 ; [rip+00001EBE]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	47BDh

l000000000000473E:
	movzx	eax,byte ptr [rbp-1Ah]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004BAA]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	mov	rbx,rax
	movzx	eax,byte ptr [rbp-19h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004B85]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	cmp	rbx,rax
	setl	al
	movzx	eax,al
	mov	edi,eax
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	mov	eax,[0000000000009300]                                 ; [rip+00004B51]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+00004B48]
	mov	eax,1h

l00000000000047BD:
	mov	rbx,[rbp-18h]
	xor	rbx,fs:[0028h]
	jz	47D1h

l00000000000047CC:
	call	2170h

l00000000000047D1:
	add	rsp,18h
	pop	rbx
	pop	rbp
	ret

;; jmp_f: 00000000000047D8
jmp_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+000047E6]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00004B01]
	lea	edx,[rax+1h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	4859h

l0000000000004818:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	4859h

l0000000000004820:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	4859h

l0000000000004828:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	4859h

l0000000000004830:
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00004AA2]
	lea	rsi,[0000000000006628]                                 ; [rip+00001DE3]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	487Fh

l0000000000004859:
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004A8F]
	mov	eax,[rdx+rax]
	mov	[0000000000009300],eax                                 ; [rip+00004A86]
	mov	eax,1h

l000000000000487F:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	4893h

l000000000000488E:
	call	2170h

l0000000000004893:
	leave
	ret

;; jmpz_f: 0000000000004895
jmpz_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00004729]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00004A44]
	lea	edx,[rax+1h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	4916h

l00000000000048D5:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	4916h

l00000000000048DD:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	4916h

l00000000000048E5:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	4916h

l00000000000048ED:
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+000049E5]
	lea	rsi,[0000000000006658]                                 ; [rip+00001D56]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	4950h

l0000000000004916:
	call	253Bh
	test	eax,eax
	jz	493Ch

l000000000000491F:
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000049C9]
	mov	eax,[rdx+rax]
	jmp	4945h

l000000000000493C:
	mov	eax,[0000000000009300]                                 ; [rip+000049BE]
	add	eax,2h

l0000000000004945:
	mov	[0000000000009300],eax                                 ; [rip+000049B5]
	mov	eax,1h

l0000000000004950:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	4964h

l000000000000495F:
	call	2170h

l0000000000004964:
	leave
	ret

;; jmpc_f: 0000000000004966
jmpc_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00004658]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00004973]
	lea	edx,[rax+1h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	49E7h

l00000000000049A6:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	49E7h

l00000000000049AE:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	49E7h

l00000000000049B6:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	49E7h

l00000000000049BE:
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00004914]
	lea	rsi,[0000000000006690]                                 ; [rip+00001CBD]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	4A21h

l00000000000049E7:
	call	24F9h
	test	eax,eax
	jz	4A0Dh

l00000000000049F0:
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000048F8]
	mov	eax,[rdx+rax]
	jmp	4A16h

l0000000000004A0D:
	mov	eax,[0000000000009300]                                 ; [rip+000048ED]
	add	eax,2h

l0000000000004A16:
	mov	[0000000000009300],eax                                 ; [rip+000048E4]
	mov	eax,1h

l0000000000004A21:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	4A35h

l0000000000004A30:
	call	2170h

l0000000000004A35:
	leave
	ret

;; jmpe_f: 0000000000004A37
jmpe_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00004587]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+000048A2]
	lea	edx,[rax+1h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	4AB8h

l0000000000004A77:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	4AB8h

l0000000000004A7F:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	4AB8h

l0000000000004A87:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	4AB8h

l0000000000004A8F:
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00004843]
	lea	rsi,[00000000000066C8]                                 ; [rip+00001C24]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	4AF2h

l0000000000004AB8:
	call	251Ah
	test	eax,eax
	jz	4ADEh

l0000000000004AC1:
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004827]
	mov	eax,[rdx+rax]
	jmp	4AE7h

l0000000000004ADE:
	mov	eax,[0000000000009300]                                 ; [rip+0000481C]
	add	eax,2h

l0000000000004AE7:
	mov	[0000000000009300],eax                                 ; [rip+00004813]
	mov	eax,1h

l0000000000004AF2:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	4B06h

l0000000000004B01:
	call	2170h

l0000000000004B06:
	leave
	ret

;; call_f: 0000000000004B08
call_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+000044B6]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+000047D1]
	lea	edx,[rax+1h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	4B89h

l0000000000004B48:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	4B89h

l0000000000004B50:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	4B89h

l0000000000004B58:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	4B89h

l0000000000004B60:
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00004772]
	lea	rsi,[0000000000006700]                                 ; [rip+00001B8B]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	4BF7h

l0000000000004B89:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2419h
	mov	edi,0h
	call	2489h
	mov	eax,[0000000000009300]                                 ; [rip+00004753]
	lea	edx,[rax+2h]
	mov	eax,[0000000000009308]                                 ; [rip+00004752]
	add	eax,2h
	mov	esi,edx
	mov	edi,eax
	call	5B1Ch
	mov	eax,[0000000000009308]                                 ; [rip+00004740]
	add	eax,2h
	mov	[0000000000009308],eax                                 ; [rip+00004737]
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004717]
	mov	eax,[rdx+rax]
	mov	[0000000000009300],eax                                 ; [rip+0000470E]
	mov	eax,1h

l0000000000004BF7:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	4C0Bh

l0000000000004C06:
	call	2170h

l0000000000004C0B:
	leave
	ret

;; ret_f: 0000000000004C0D
ret_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	call	[0000000000008FD0]                                    ; [rip+000043B5]
	mov	eax,[0000000000009308]                                 ; [rip+000046E7]
	sub	eax,2h
	mov	[0000000000009308],eax                                 ; [rip+000046DE]
	mov	eax,[0000000000009308]                                 ; [rip+000046D8]
	add	eax,2h
	lea	rsi,[0000000000009300]                                 ; [rip+000046C6]
	mov	edi,eax
	call	5A8Dh
	mov	eax,1h
	pop	rbp
	ret

;; callprintfd_f: 0000000000004C48
callprintfd_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00004376]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00004691]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Dh]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,4h
	jz	4CC9h

l0000000000004C88:
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,5h
	jz	4CC9h

l0000000000004C90:
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,6h
	jz	4CC9h

l0000000000004C98:
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,7h
	jz	4CC9h

l0000000000004CA0:
	movzx	eax,byte ptr [rbp-0Dh]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00004632]
	lea	rsi,[0000000000006738]                                 ; [rip+00001A83]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	4D41h

l0000000000004CC9:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	movzx	eax,byte ptr [rbp-0Dh]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004601]
	mov	eax,[rdx+rax]
	lea	rdx,[rbp-0Ch]
	mov	rsi,rdx
	mov	edi,eax
	call	5A8Dh
	mov	eax,[rbp-0Ch]
	mov	edi,eax
	call	258Bh
	mov	esi,eax
	lea	rdi,[0000000000006770]                                 ; [rip+00001A4D]
	mov	eax,0h
	call	2180h
	mov	eax,[0000000000009300]                                 ; [rip+000045CD]
	add	eax,2h
	mov	[0000000000009300],eax                                 ; [rip+000045C4]
	mov	eax,1h

l0000000000004D41:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	4D55h

l0000000000004D50:
	call	2170h

l0000000000004D55:
	leave
	ret

;; callprintfu_f: 0000000000004D57
callprintfu_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00004267]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00004582]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Dh]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,4h
	jz	4DD8h

l0000000000004D97:
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,5h
	jz	4DD8h

l0000000000004D9F:
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,6h
	jz	4DD8h

l0000000000004DA7:
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,7h
	jz	4DD8h

l0000000000004DAF:
	movzx	eax,byte ptr [rbp-0Dh]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00004523]
	lea	rsi,[0000000000006778]                                 ; [rip+000019B4]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	4E49h

l0000000000004DD8:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	movzx	eax,byte ptr [rbp-0Dh]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000044F2]
	mov	eax,[rdx+rax]
	lea	rdx,[rbp-0Ch]
	mov	rsi,rdx
	mov	edi,eax
	call	5A8Dh
	mov	eax,[rbp-0Ch]
	mov	esi,eax
	lea	rdi,[00000000000067B0]                                 ; [rip+00001985]
	mov	eax,0h
	call	2180h
	mov	eax,[0000000000009300]                                 ; [rip+000044C5]
	add	eax,2h
	mov	[0000000000009300],eax                                 ; [rip+000044BC]
	mov	eax,1h

l0000000000004E49:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	4E5Dh

l0000000000004E58:
	call	2170h

l0000000000004E5D:
	leave
	ret

;; callprintfs_f: 0000000000004E5F
callprintfs_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+0000415F]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+0000447A]
	lea	edx,[rax+1h]
	lea	rax,[rbp-9h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,4h
	jz	4EE0h

l0000000000004E9F:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,5h
	jz	4EE0h

l0000000000004EA7:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,6h
	jz	4EE0h

l0000000000004EAF:
	movzx	eax,byte ptr [rbp-9h]
	cmp	al,7h
	jz	4EE0h

l0000000000004EB7:
	movzx	eax,byte ptr [rbp-9h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+0000441B]
	lea	rsi,[00000000000067B8]                                 ; [rip+000018EC]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	4F48h

l0000000000004EE0:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	movzx	eax,byte ptr [rbp-9h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000043EA]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	5BFDh
	mov	rsi,rax
	lea	rdi,[00000000000067F0]                                 ; [rip+000018C6]
	mov	eax,0h
	call	2180h
	mov	eax,[0000000000009300]                                 ; [rip+000043C6]
	add	eax,2h
	mov	[0000000000009300],eax                                 ; [rip+000043BD]
	mov	eax,1h

l0000000000004F48:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	4F5Ch

l0000000000004F57:
	call	2170h

l0000000000004F5C:
	leave
	ret

;; callscanfd_f: 0000000000004F5E
callscanfd_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00004060]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+0000437B]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Dh]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,4h
	jz	4FE2h

l0000000000004F9E:
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,5h
	jz	4FE2h

l0000000000004FA6:
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,6h
	jz	4FE2h

l0000000000004FAE:
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,7h
	jz	4FE2h

l0000000000004FB6:
	movzx	eax,byte ptr [rbp-0Dh]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+0000431C]
	lea	rsi,[00000000000067F8]                                 ; [rip+0000182D]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	5084h

l0000000000004FE2:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	lea	rax,[rbp-0Ch]
	mov	rsi,rax
	lea	rdi,[0000000000006770]                                 ; [rip+0000176C]
	mov	eax,0h
	call	2220h
	cmp	eax,1h
	jnz	5066h

l0000000000005013:
	mov	eax,[rbp-0Ch]
	cmp	eax,0FFFF8000h
	jl	5066h

l000000000000501D:
	mov	eax,[rbp-0Ch]
	cmp	eax,7FFFh
	jg	5066h

l0000000000005027:
	mov	eax,[rbp-0Ch]
	cdqe
	mov	rdi,rax
	call	25F2h
	mov	edx,eax
	movzx	eax,byte ptr [rbp-0Dh]
	movzx	eax,al
	cdqe
	lea	rcx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+000042B2]
	mov	eax,[rcx+rax]
	mov	esi,edx
	mov	edi,eax
	call	5B1Ch
	mov	edi,0h
	call	2419h
	jmp	5070h

l0000000000005066:
	mov	edi,1h
	call	2419h

l0000000000005070:
	mov	eax,[0000000000009300]                                 ; [rip+0000428A]
	add	eax,2h
	mov	[0000000000009300],eax                                 ; [rip+00004281]
	mov	eax,1h

l0000000000005084:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	5098h

l0000000000005093:
	call	2170h

l0000000000005098:
	leave
	ret

;; callscanfu_f: 000000000000509A
callscanfu_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00003F24]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+0000423F]
	lea	edx,[rax+1h]
	lea	rax,[rbp-0Dh]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,4h
	jz	511Eh

l00000000000050DA:
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,5h
	jz	511Eh

l00000000000050E2:
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,6h
	jz	511Eh

l00000000000050EA:
	movzx	eax,byte ptr [rbp-0Dh]
	cmp	al,7h
	jz	511Eh

l00000000000050F2:
	movzx	eax,byte ptr [rbp-0Dh]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+000041E0]
	lea	rsi,[0000000000006830]                                 ; [rip+00001729]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	51AAh

l000000000000511E:
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	lea	rax,[rbp-0Ch]
	mov	rsi,rax
	lea	rdi,[00000000000067B0]                                 ; [rip+00001670]
	mov	eax,0h
	call	2220h
	cmp	eax,1h
	jnz	518Ch

l000000000000514F:
	mov	eax,[rbp-0Ch]
	cmp	eax,0FFFFh
	ja	518Ch

l0000000000005159:
	mov	edx,[rbp-0Ch]
	movzx	eax,byte ptr [rbp-0Dh]
	movzx	eax,al
	cdqe
	lea	rcx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+0000418C]
	mov	eax,[rcx+rax]
	mov	esi,edx
	mov	edi,eax
	call	5B1Ch
	mov	edi,0h
	call	2419h
	jmp	5196h

l000000000000518C:
	mov	edi,1h
	call	2419h

l0000000000005196:
	mov	eax,[0000000000009300]                                 ; [rip+00004164]
	add	eax,2h
	mov	[0000000000009300],eax                                 ; [rip+0000415B]
	mov	eax,1h

l00000000000051AA:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	51BEh

l00000000000051B9:
	call	2170h

l00000000000051BE:
	leave
	ret

;; callscanfs_f: 00000000000051C0
callscanfs_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,20h
	call	[0000000000008FD0]                                    ; [rip+00003DFE]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax
	mov	eax,[0000000000009300]                                 ; [rip+00004119]
	lea	edx,[rax+1h]
	lea	rax,[rbp-12h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	mov	eax,[0000000000009300]                                 ; [rip+00004102]
	lea	edx,[rax+2h]
	lea	rax,[rbp-11h]
	mov	rsi,rax
	mov	edi,edx
	call	59C9h
	movzx	eax,byte ptr [rbp-12h]
	cmp	al,4h
	jz	523Fh

l0000000000005217:
	movzx	eax,byte ptr [rbp-12h]
	cmp	al,5h
	jz	523Fh

l000000000000521F:
	movzx	eax,byte ptr [rbp-12h]
	cmp	al,6h
	jz	523Fh

l0000000000005227:
	movzx	eax,byte ptr [rbp-12h]
	cmp	al,7h
	jz	523Fh

l000000000000522F:
	movzx	eax,byte ptr [rbp-12h]
	cmp	al,2h
	jz	523Fh

l0000000000005237:
	movzx	eax,byte ptr [rbp-12h]
	cmp	al,3h
	jnz	526Fh

l000000000000523F:
	movzx	eax,byte ptr [rbp-11h]
	cmp	al,4h
	jz	52A2h

l0000000000005247:
	movzx	eax,byte ptr [rbp-11h]
	cmp	al,5h
	jz	52A2h

l000000000000524F:
	movzx	eax,byte ptr [rbp-11h]
	cmp	al,6h
	jz	52A2h

l0000000000005257:
	movzx	eax,byte ptr [rbp-11h]
	cmp	al,7h
	jz	52A2h

l000000000000525F:
	movzx	eax,byte ptr [rbp-11h]
	cmp	al,2h
	jz	52A2h

l0000000000005267:
	movzx	eax,byte ptr [rbp-11h]
	cmp	al,3h
	jz	52A2h

l000000000000526F:
	movzx	eax,byte ptr [rbp-11h]
	movzx	ecx,al
	movzx	eax,byte ptr [rbp-12h]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+0000405C]
	lea	rsi,[0000000000006868]                                 ; [rip+000015DD]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	5378h

l00000000000052A2:
	mov	dword ptr [rbp-10h],0h
	jmp	52DFh

l00000000000052AB:
	mov	eax,[rbp-0Ch]
	movzx	eax,al
	movzx	edx,byte ptr [rbp-12h]
	movzx	edx,dl
	movsxd	rdx,edx
	lea	rcx,[0000h+rdx*4]
	lea	rdx,[0000000000009300]                                 ; [rip+00004036]
	mov	ecx,[rcx+rdx]
	mov	edx,[rbp-10h]
	add	edx,ecx
	mov	esi,eax
	mov	edi,edx
	call	5A2Ch
	add	dword ptr [rbp-10h],1h

l00000000000052DF:
	movzx	eax,byte ptr [rbp-11h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00004009]
	mov	eax,[rdx+rax]
	cmp	[rbp-10h],eax
	jnc	5313h

l00000000000052FF:
	call	21B0h
	mov	[rbp-0Ch],eax
	cmp	dword ptr [rbp-0Ch],0FFh
	jz	5313h

l000000000000530D:
	cmp	dword ptr [rbp-0Ch],0Ah
	jnz	52ABh

l0000000000005313:
	movzx	eax,byte ptr [rbp-12h]
	movzx	eax,al
	cdqe
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00003FD5]
	mov	edx,[rdx+rax]
	mov	eax,[rbp-10h]
	add	eax,edx
	mov	esi,0h
	mov	edi,eax
	call	5A2Ch
	mov	edi,0h
	call	23A9h
	cmp	dword ptr [rbp-10h],0h
	setz	al
	movzx	eax,al
	mov	edi,eax
	call	2489h
	mov	edi,0h
	call	2419h
	mov	eax,[0000000000009300]                                 ; [rip+00003F96]
	add	eax,3h
	mov	[0000000000009300],eax                                 ; [rip+00003F8D]
	mov	eax,1h

l0000000000005378:
	mov	rsi,[rbp-8h]
	xor	rsi,fs:[0028h]
	jz	538Ch

l0000000000005387:
	call	2170h

l000000000000538C:
	leave
	ret

;; nop_f: 000000000000538E
nop_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	call	[0000000000008FD0]                                    ; [rip+00003C34]
	mov	edi,0h
	call	23A9h
	mov	edi,0h
	call	2489h
	mov	edi,0h
	call	2419h
	mov	eax,[0000000000009300]                                 ; [rip+00003F40]
	add	eax,1h
	mov	[0000000000009300],eax                                 ; [rip+00003F37]
	mov	eax,1h
	pop	rbp
	ret

;; end_f: 00000000000053D0
end_f proc
	endbr64
	push	rbp
	mov	rbp,rsp
	call	[0000000000008FD0]                                    ; [rip+00003BF2]
	mov	eax,1h
	pop	rbp
	ret

;; printSIPRO: 00000000000053E5
;;   Called from:
;;     000000000000569D (in execute)
printSIPRO proc
	endbr64
	push	rbp
	mov	rbp,rsp
	push	rbx
	sub	rsp,28h
	call	[0000000000008FD0]                                    ; [rip+00003BD8]
	mov	rax,fs:[0028h]
	mov	[rbp-18h],rax
	xor	eax,eax
	mov	dword ptr [rbp-20h],0h
	jmp	5496h

l0000000000005413:
	mov	eax,[rbp-20h]
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00003EDB]
	mov	ebx,[rdx+rax]
	mov	eax,[rbp-20h]
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00003EC6]
	mov	eax,[rdx+rax]
	mov	edi,eax
	call	258Bh
	mov	esi,eax
	mov	eax,[rbp-20h]
	lea	rdx,[0000h+rax*4]
	lea	rax,[0000000000009300]                                 ; [rip+00003EA8]
	mov	ecx,[rdx+rax]
	mov	eax,[rbp-20h]
	lea	rdx,[0000h+rax*8]
	lea	rax,[0000000000008C80]                                 ; [rip+00003813]
	mov	rdx,[rdx+rax]
	mov	rax,[00000000000092E0]                                 ; [rip+00003E68]
	mov	r9d,ebx
	mov	r8d,esi
	lea	rsi,[00000000000068A7]                                 ; [rip+00001422]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	add	dword ptr [rbp-20h],1h

l0000000000005496:
	mov	eax,[rbp-20h]
	lea	rdx,[0000h+rax*8]
	lea	rax,[0000000000008C80]                                 ; [rip+000037D8]
	mov	rax,[rdx+rax]
	test	rax,rax
	jnz	5413h

l00000000000054B5:
	mov	rax,[00000000000092E0]                                 ; [rip+00003E24]
	mov	rsi,rax
	mov	edi,0Ah
	call	21A0h
	movzx	eax,[0000000000009321]                               ; [rip+00003E51]
	test	al,al
	jz	5569h

l00000000000054D8:
	mov	dword ptr [rbp-1Ch],0Ah
	jmp	554Fh

l00000000000054E1:
	mov	eax,[000000000000930C]                                 ; [rip+00003E25]
	mov	edi,eax
	call	258Bh
	mov	edx,eax
	mov	eax,[rbp-1Ch]
	add	eax,eax
	add	eax,edx
	test	eax,eax
	js	554Bh

l00000000000054FB:
	mov	eax,[000000000000930C]                                 ; [rip+00003E0B]
	mov	edx,[rbp-1Ch]
	add	edx,edx
	add	edx,eax
	lea	rax,[rbp-24h]
	mov	rsi,rax
	mov	edi,edx
	call	5A8Dh
	mov	esi,[rbp-24h]
	mov	eax,[000000000000930C]                                 ; [rip+00003DED]
	mov	edx,[rbp-1Ch]
	add	edx,edx
	lea	ecx,[rax+rdx]
	mov	eax,[rbp-1Ch]
	lea	edx,[rax+rax]
	mov	rax,[00000000000092E0]                                 ; [rip+00003DAC]
	mov	r8d,esi
	lea	rsi,[00000000000068C3]                                 ; [rip+00001385]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h

l000000000000554B:
	sub	dword ptr [rbp-1Ch],1h

l000000000000554F:
	cmp	dword ptr [rbp-1Ch],0F6h
	jge	54E1h

l0000000000005555:
	mov	rax,[00000000000092E0]                                 ; [rip+00003D84]
	mov	rsi,rax
	mov	edi,0Ah
	call	21A0h

l0000000000005569:
	nop
	mov	rax,[rbp-18h]
	xor	rax,fs:[0028h]
	jz	557Eh

l0000000000005579:
	call	2170h

l000000000000557E:
	add	rsp,28h
	pop	rbx
	pop	rbp
	ret

;; execute: 0000000000005585
;;   Called from:
;;     0000000000005745 (in startProg)
execute proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00003A39]
	mov	rax,fs:[0028h]
	mov	[rbp-8h],rax
	xor	eax,eax

l00000000000055A6:
	mov	eax,[0000000000009300]                                 ; [rip+00003D54]
	lea	rdx,[rbp-0Dh]
	mov	rsi,rdx
	mov	edi,eax
	call	59C9h
	mov	dword ptr [rbp-0Ch],0h
	jmp	55C7h

l00000000000055C3:
	add	dword ptr [rbp-0Ch],1h

l00000000000055C7:
	mov	eax,[rbp-0Ch]
	lea	rdx,[rax+rax]
	lea	rax,[0000000000009020]                                 ; [rip+00003A4B]
	movzx	eax,word ptr [rdx+rax]
	cmp	ax,0FFh
	jz	55FFh

l00000000000055DF:
	mov	eax,[rbp-0Ch]
	lea	rdx,[rax+rax]
	lea	rax,[0000000000009020]                                 ; [rip+00003A33]
	movzx	eax,word ptr [rdx+rax]
	movsx	edx,ax
	movzx	eax,byte ptr [rbp-0Dh]
	movzx	eax,al
	cmp	edx,eax
	jnz	55C3h

l00000000000055FF:
	mov	eax,[rbp-0Ch]
	lea	rdx,[rax+rax]
	lea	rax,[0000000000009020]                                 ; [rip+00003A13]
	movzx	eax,word ptr [rdx+rax]
	cmp	ax,0FFh
	jnz	5643h

l0000000000005617:
	movzx	eax,byte ptr [rbp-0Dh]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00003CBB]
	lea	rsi,[00000000000068D3]                                 ; [rip+000012A7]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	5712h

l0000000000005643:
	movzx	eax,[0000000000009320]                               ; [rip+00003CD6]
	test	al,al
	jz	56A2h

l000000000000564E:
	mov	eax,[rbp-0Ch]
	lea	rdx,[0000h+rax*8]
	lea	rax,[00000000000091A0]                                 ; [rip+00003B40]
	mov	rdi,[rdx+rax]
	movzx	eax,byte ptr [rbp-0Dh]
	movzx	esi,al
	mov	ecx,[0000000000009300]                                 ; [rip+00003C8F]
	mov	edx,[0000000000009300]                                 ; [rip+00003C89]
	mov	rax,[00000000000092E0]                                 ; [rip+00003C62]
	mov	r9,rdi
	mov	r8d,esi
	lea	rsi,[00000000000068F0]                                 ; [rip+00001265]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	call	53E5h

l00000000000056A2:
	mov	eax,[rbp-0Ch]
	lea	rdx,[0000h+rax*8]
	lea	rax,[0000000000009080]                                 ; [rip+000039CC]
	mov	rax,[rdx+rax]
	call	rax
	test	eax,eax
	jnz	56E7h

l00000000000056BE:
	movzx	eax,byte ptr [rbp-0Dh]
	movzx	edx,al
	mov	rax,[00000000000092E0]                                 ; [rip+00003C14]
	lea	rsi,[0000000000006920]                                 ; [rip+0000124D]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,0h
	jmp	5712h

l00000000000056E7:
	mov	eax,[rbp-0Ch]
	lea	rdx,[0000h+rax*8]
	lea	rax,[0000000000009080]                                 ; [rip+00003987]
	mov	rax,[rdx+rax]
	lea	rdx,[00000000000053D0]                                 ; [rip-00000334]
	cmp	rax,rdx
	jnz	55A6h

l000000000000570D:
	mov	eax,1h

l0000000000005712:
	mov	rcx,[rbp-8h]
	xor	rcx,fs:[0028h]
	jz	5726h

l0000000000005721:
	call	2170h

l0000000000005726:
	leave
	ret

;; startProg: 0000000000005728
;;   Called from:
;;     00000000000059BA (in main)
startProg proc
	endbr64
	push	rbp
	mov	rbp,rsp
	call	[0000000000008FD0]                                    ; [rip+0000389A]
	mov	[0000000000009300],0h                                  ; [rip+00003BC0]
	mov	eax,0h
	call	5585h
	pop	rbp
	ret

;; usage: 000000000000574C
;;   Called from:
;;     000000000000587D (in main)
;;     00000000000058DD (in main)
usage proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,20h
	call	[0000000000008FD0]                                    ; [rip+00003872]
	mov	[rbp-8h],rdi
	mov	[rbp-10h],rsi
	mov	[rbp-18h],rdx
	mov	rax,[rbp-8h]
	mov	rcx,rax
	mov	edx,0Bh
	mov	esi,1h
	lea	rdi,[0000000000006950]                                 ; [rip+000011CE]
	call	2240h
	mov	rdx,[rbp-10h]
	mov	rax,[rbp-8h]
	lea	rsi,[0000000000006960]                                 ; [rip+000011CA]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	rax,[rbp-8h]
	mov	rcx,rax
	mov	edx,17h
	mov	esi,1h
	lea	rdi,[000000000000697F]                                 ; [rip+000011C4]
	call	2240h
	mov	rax,[rbp-8h]
	mov	rcx,rax
	mov	edx,11h
	mov	esi,1h
	lea	rdi,[0000000000006997]                                 ; [rip+000011BF]
	call	2240h
	mov	rax,[rbp-8h]
	mov	rcx,rax
	mov	edx,26h
	mov	esi,1h
	lea	rdi,[00000000000069B0]                                 ; [rip+000011BB]
	call	2240h
	mov	rax,[rbp-8h]
	mov	rcx,rax
	mov	edx,20h
	mov	esi,1h
	lea	rdi,[00000000000069D8]                                 ; [rip+000011C6]
	call	2240h
	mov	rax,[rbp-8h]
	mov	rcx,rax
	mov	edx,22h
	mov	esi,1h
	lea	rdi,[0000000000006A00]                                 ; [rip+000011D1]
	call	2240h
	nop
	leave
	ret

;; main: 0000000000005837
main proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,20h
	call	[0000000000008FD0]                                    ; [rip+00003787]
	mov	[rbp-14h],edi
	mov	[rbp-20h],rsi
	mov	byte ptr [rbp-0Dh],0h
	cmp	dword ptr [rbp-14h],1h
	jg	58ECh

l000000000000585E:
	mov	rax,[rbp-20h]
	add	rax,8h
	mov	rdx,[rax]
	mov	rax,[rbp-20h]
	mov	rcx,[rax]
	mov	rax,[00000000000092E0]                                 ; [rip+00003A69]
	mov	rsi,rcx
	mov	rdi,rax
	call	574Ch
	mov	eax,1h
	jmp	59C7h

l000000000000588C:
	cmp	dword ptr [rbp-0Ch],74h
	jz	58A6h

l0000000000005892:
	cmp	dword ptr [rbp-0Ch],74h
	jg	58BEh

l0000000000005898:
	cmp	dword ptr [rbp-0Ch],64h
	jz	58AFh

l000000000000589E:
	cmp	dword ptr [rbp-0Ch],73h
	jz	58B5h

l00000000000058A4:
	jmp	58BEh

l00000000000058A6:
	mov	[0000000000009320],1h                                  ; [rip+00003A73]
	jmp	58ECh

l00000000000058AF:
	mov	byte ptr [rbp-0Dh],1h
	jmp	58ECh

l00000000000058B5:
	mov	[0000000000009321],1h                                  ; [rip+00003A65]
	jmp	58ECh

l00000000000058BE:
	mov	rax,[rbp-20h]
	add	rax,8h
	mov	rdx,[rax]
	mov	rax,[rbp-20h]
	mov	rcx,[rax]
	mov	rax,[00000000000092E0]                                 ; [rip+00003A09]
	mov	rsi,rcx
	mov	rdi,rax
	call	574Ch
	mov	edi,1h
	call	2230h

l00000000000058EC:
	mov	rcx,[rbp-20h]
	mov	eax,[rbp-14h]
	lea	rdx,[0000000000006A23]                                 ; [rip+00001129]
	mov	rsi,rcx
	mov	edi,eax
	call	2200h
	mov	[rbp-0Ch],eax
	cmp	dword ptr [rbp-0Ch],0FFh
	jnz	588Ch

l0000000000005911:
	mov	eax,[00000000000092C0]                                 ; [rip+000039A9]
	cdqe
	lea	rdx,[0000h+rax*8]
	mov	rax,[rbp-20h]
	add	rax,rdx
	mov	rax,[rax]
	lea	rsi,[0000000000006A28]                                 ; [rip+000010F6]
	mov	rdi,rax
	call	21F0h
	mov	[rbp-8h],rax
	cmp	qword ptr [rbp-8h],0h
	jnz	5992h

l0000000000005945:
	call	2150h
	mov	eax,[rax]
	mov	edi,eax
	call	2250h
	mov	rcx,rax
	mov	eax,[00000000000092C0]                                 ; [rip+00003964]
	cdqe
	lea	rdx,[0000h+rax*8]
	mov	rax,[rbp-20h]
	add	rax,rdx
	mov	rdx,[rax]
	mov	rax,[00000000000092E0]                                 ; [rip+00003969]
	lea	rsi,[0000000000006A2B]                                 ; [rip+000010AD]
	mov	rdi,rax
	mov	eax,0h
	call	21D0h
	mov	eax,1h
	jmp	59C7h

l0000000000005992:
	mov	rax,[rbp-8h]
	mov	rdi,rax
	call	5BA0h
	mov	rax,[rbp-8h]
	mov	rdi,rax
	call	2160h
	cmp	byte ptr [rbp-0Dh],0h
	jz	59B5h

l00000000000059B0:
	call	5C21h

l00000000000059B5:
	mov	eax,0h
	call	5728h
	test	eax,eax
	setz	al
	movzx	eax,al

l00000000000059C7:
	leave
	ret

;; readByte: 00000000000059C9
;;   Called from:
;;     0000000000002644 (in shiftr_f)
;;     0000000000002765 (in shiftl_f)
;;     000000000000288B (in and_f)
;;     00000000000028A2 (in and_f)
;;     00000000000029E8 (in or_f)
;;     00000000000029FF (in or_f)
;;     0000000000002B45 (in xor_f)
;;     0000000000002B5C (in xor_f)
;;     0000000000002CA2 (in not_f)
;;     0000000000002F18 (in add_f)
;;     0000000000002F2F (in add_f)
;;     0000000000003095 (in sub_f)
;;     00000000000030AC (in sub_f)
;;     0000000000003468 (in mul_f)
;;     000000000000347F (in mul_f)
;;     000000000000361E (in div_f)
;;     0000000000003635 (in div_f)
;;     00000000000038C1 (in cp_f)
;;     00000000000038D8 (in cp_f)
;;     0000000000003A1F (in loadw_f)
;;     0000000000003A36 (in loadw_f)
;;     0000000000003B86 (in storew_f)
;;     0000000000003B9D (in storew_f)
;;     0000000000003CEC (in loadb_f)
;;     0000000000003D03 (in loadb_f)
;;     0000000000003DBC (in loadb_f)
;;     0000000000003E5F (in storeb_f)
;;     0000000000003E76 (in storeb_f)
;;     0000000000003FC8 (in const_f)
;;     000000000000411E (in push_f)
;;     0000000000004233 (in pop_f)
;;     0000000000004368 (in cmp_f)
;;     000000000000437F (in cmp_f)
;;     000000000000452F (in uless_f)
;;     0000000000004546 (in uless_f)
;;     0000000000004692 (in sless_f)
;;     00000000000046A9 (in sless_f)
;;     000000000000480B (in jmp_f)
;;     00000000000048C8 (in jmpz_f)
;;     0000000000004999 (in jmpc_f)
;;     0000000000004A6A (in jmpe_f)
;;     0000000000004B3B (in call_f)
;;     0000000000004C7B (in callprintfd_f)
;;     0000000000004D8A (in callprintfu_f)
;;     0000000000004E92 (in callprintfs_f)
;;     0000000000004F91 (in callscanfd_f)
;;     00000000000050CD (in callscanfu_f)
;;     00000000000051F3 (in callscanfs_f)
;;     000000000000520A (in callscanfs_f)
;;     00000000000055B5 (in execute)
readByte proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+000035F5]
	mov	[rbp-4h],edi
	mov	[rbp-10h],rsi
	cmp	dword ptr [rbp-4h],7FFFh
	jbe	5A15h

l00000000000059EB:
	mov	rax,[00000000000092E0]                                 ; [rip+000038EE]
	mov	rcx,rax
	mov	edx,0Bh
	mov	esi,1h
	lea	rdi,[0000000000006A60]                                 ; [rip+0000105A]
	call	2240h
	mov	edi,1h
	call	2230h

l0000000000005A15:
	mov	eax,[rbp-4h]
	lea	rdx,[0000000000009340]                                 ; [rip+00003921]
	movzx	edx,byte ptr [rax+rdx]
	mov	rax,[rbp-10h]
	mov	[rax],dl
	nop
	leave
	ret

;; writeByte: 0000000000005A2C
;;   Called from:
;;     0000000000003F48 (in storeb_f)
;;     00000000000052D6 (in callscanfs_f)
;;     000000000000533A (in callscanfs_f)
;;     0000000000005BCC (in loadMemoryFromFile)
writeByte proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00003592]
	mov	[rbp-4h],edi
	mov	eax,esi
	mov	[rbp-8h],al
	cmp	dword ptr [rbp-4h],7FFFh
	jbe	5A79h

l0000000000005A4F:
	mov	rax,[00000000000092E0]                                 ; [rip+0000388A]
	mov	rcx,rax
	mov	edx,0Bh
	mov	esi,1h
	lea	rdi,[0000000000006A60]                                 ; [rip+00000FF6]
	call	2240h
	mov	edi,1h
	call	2230h

l0000000000005A79:
	mov	eax,[rbp-4h]
	lea	rcx,[0000000000009340]                                 ; [rip+000038BD]
	movzx	edx,byte ptr [rbp-8h]
	mov	[rax+rcx],dl
	nop
	leave
	ret

;; readWord: 0000000000005A8D
;;   Called from:
;;     0000000000003B06 (in loadw_f)
;;     000000000000405F (in const_f)
;;     000000000000409E (in const_f)
;;     00000000000042FA (in pop_f)
;;     0000000000004C3C (in ret_f)
;;     0000000000004D0B (in callprintfd_f)
;;     0000000000004E1A (in callprintfu_f)
;;     0000000000005511 (in printSIPRO)
readWord proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+00003531]
	mov	[rbp-4h],edi
	mov	[rbp-10h],rsi
	cmp	dword ptr [rbp-4h],7FFFh
	ja	5AB9h

l0000000000005AAF:
	mov	eax,[rbp-4h]
	and	eax,1h
	test	eax,eax
	jz	5AE3h

l0000000000005AB9:
	mov	rax,[00000000000092E0]                                 ; [rip+00003820]
	mov	rcx,rax
	mov	edx,0Bh
	mov	esi,1h
	lea	rdi,[0000000000006A60]                                 ; [rip+00000F8C]
	call	2240h
	mov	edi,1h
	call	2230h

l0000000000005AE3:
	mov	eax,[rbp-4h]
	lea	rdx,[0000000000009340]                                 ; [rip+00003853]
	movzx	eax,byte ptr [rax+rdx]
	movzx	eax,al
	shl	eax,8h
	mov	ecx,eax
	mov	eax,[rbp-4h]
	add	eax,1h
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+00003838]
	movzx	eax,byte ptr [rdx+rax]
	movzx	eax,al
	or	ecx,eax
	mov	edx,ecx
	mov	rax,[rbp-10h]
	mov	[rax],edx
	nop
	leave
	ret

;; writeWord: 0000000000005B1C
;;   Called from:
;;     0000000000003C6C (in storew_f)
;;     00000000000041C2 (in push_f)
;;     0000000000004BBD (in call_f)
;;     0000000000005055 (in callscanfd_f)
;;     000000000000517B (in callscanfu_f)
writeWord proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,10h
	call	[0000000000008FD0]                                    ; [rip+000034A2]
	mov	[rbp-4h],edi
	mov	[rbp-8h],esi
	cmp	dword ptr [rbp-4h],7FFFh
	ja	5B47h

l0000000000005B3D:
	mov	eax,[rbp-4h]
	and	eax,1h
	test	eax,eax
	jz	5B71h

l0000000000005B47:
	mov	rax,[00000000000092E0]                                 ; [rip+00003792]
	mov	rcx,rax
	mov	edx,0Bh
	mov	esi,1h
	lea	rdi,[0000000000006A60]                                 ; [rip+00000EFE]
	call	2240h
	mov	edi,1h
	call	2230h

l0000000000005B71:
	mov	eax,[rbp-8h]
	shr	eax,8h
	mov	ecx,eax
	mov	eax,[rbp-4h]
	lea	rdx,[0000000000009340]                                 ; [rip+000037BD]
	mov	[rax+rdx],cl
	mov	eax,[rbp-4h]
	lea	edx,[rax+1h]
	mov	eax,[rbp-8h]
	mov	ecx,eax
	mov	edx,edx
	lea	rax,[0000000000009340]                                 ; [rip+000037A6]
	mov	[rdx+rax],cl
	nop
	leave
	ret

;; loadMemoryFromFile: 0000000000005BA0
;;   Called from:
;;     0000000000005999 (in main)
loadMemoryFromFile proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,20h
	call	[0000000000008FD0]                                    ; [rip+0000341E]
	mov	[rbp-18h],rdi
	mov	dword ptr [rbp-8h],0h
	jmp	5BD5h

l0000000000005BBF:
	mov	eax,[rbp-4h]
	movzx	edx,al
	mov	eax,[rbp-8h]
	mov	esi,edx
	mov	edi,eax
	call	5A2Ch
	add	dword ptr [rbp-8h],1h

l0000000000005BD5:
	mov	rax,[rbp-18h]
	mov	rdi,rax
	call	21E0h
	test	eax,eax
	jnz	5BFAh

l0000000000005BE5:
	mov	rax,[rbp-18h]
	mov	rdi,rax
	call	2190h
	mov	[rbp-4h],eax
	cmp	dword ptr [rbp-4h],0FFh
	jnz	5BBFh

l0000000000005BFA:
	nop
	leave
	ret

;; address: 0000000000005BFD
;;   Called from:
;;     0000000000004F1B (in callprintfs_f)
address proc
	endbr64
	push	rbp
	mov	rbp,rsp
	sub	rsp,8h
	call	[0000000000008FD0]                                    ; [rip+000033C1]
	mov	[rbp-4h],edi
	mov	eax,[rbp-4h]
	lea	rdx,[0000000000009340]                                 ; [rip+00003724]
	add	rax,rdx
	leave
	ret

;; dumpMemory: 0000000000005C21
;;   Called from:
;;     00000000000059B0 (in main)
dumpMemory proc
	endbr64
	push	rbp
	mov	rbp,rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp,28h
	call	[0000000000008FD0]                                    ; [rip+00003394]
	mov	dword ptr [rbp-34h],0h
	jmp	5E03h

l0000000000005C48:
	mov	eax,[rbp-34h]
	add	eax,0Eh
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+000036E9]
	movzx	eax,byte ptr [rdx+rax]
	movzx	ecx,al
	mov	eax,[rbp-34h]
	add	eax,0Fh
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+000036D3]
	movzx	eax,byte ptr [rdx+rax]
	movzx	esi,al
	mov	eax,[rbp-34h]
	add	eax,0Ch
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+000036BD]
	movzx	eax,byte ptr [rdx+rax]
	movzx	r9d,al
	mov	eax,[rbp-34h]
	add	eax,0Dh
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+000036A6]
	movzx	eax,byte ptr [rdx+rax]
	movzx	eax,al
	mov	[rbp-44h],eax
	mov	eax,[rbp-34h]
	add	eax,0Ah
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+0000368D]
	movzx	eax,byte ptr [rdx+rax]
	movzx	ebx,al
	mov	[rbp-48h],ebx
	mov	eax,[rbp-34h]
	add	eax,0Bh
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+00003674]
	movzx	eax,byte ptr [rdx+rax]
	movzx	edi,al
	mov	[rbp-4Ch],edi
	mov	eax,[rbp-34h]
	add	eax,8h
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+0000365B]
	movzx	eax,byte ptr [rdx+rax]
	movzx	r15d,al
	mov	eax,[rbp-34h]
	add	eax,9h
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+00003644]
	movzx	eax,byte ptr [rdx+rax]
	movzx	r14d,al
	mov	eax,[rbp-34h]
	add	eax,6h
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+0000362D]
	movzx	eax,byte ptr [rdx+rax]
	movzx	r13d,al
	mov	eax,[rbp-34h]
	add	eax,7h
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+00003616]
	movzx	eax,byte ptr [rdx+rax]
	movzx	r12d,al
	mov	eax,[rbp-34h]
	add	eax,4h
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+000035FF]
	movzx	eax,byte ptr [rdx+rax]
	movzx	ebx,al
	mov	eax,[rbp-34h]
	add	eax,5h
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+000035E9]
	movzx	eax,byte ptr [rdx+rax]
	movzx	r11d,al
	mov	eax,[rbp-34h]
	add	eax,2h
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+000035D2]
	movzx	eax,byte ptr [rdx+rax]
	movzx	r10d,al
	mov	eax,[rbp-34h]
	add	eax,3h
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+000035BB]
	movzx	eax,byte ptr [rdx+rax]
	movzx	edx,al
	mov	[rbp-50h],edx
	mov	edx,[rbp-34h]
	lea	rax,[0000000000009340]                                 ; [rip+000035A7]
	movzx	eax,byte ptr [rdx+rax]
	movzx	r8d,al
	mov	eax,[rbp-34h]
	add	eax,1h
	mov	edx,eax
	lea	rax,[0000000000009340]                                 ; [rip+00003590]
	movzx	eax,byte ptr [rdx+rax]
	movzx	edx,al
	mov	rdi,[00000000000092E0]                                 ; [rip+00003522]
	mov	eax,[rbp-34h]
	sub	rsp,8h
	push	rcx
	push	rsi
	push	r9
	mov	ecx,[rbp-44h]
	push	rcx
	mov	esi,[rbp-48h]
	push	rsi
	mov	ecx,[rbp-4Ch]
	push	rcx
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	r11
	push	r10
	mov	r9d,[rbp-50h]
	mov	ecx,edx
	mov	edx,eax
	lea	rsi,[0000000000006A70]                                 ; [rip+00000C7F]
	mov	eax,0h
	call	21D0h
	add	rsp,70h
	add	dword ptr [rbp-34h],10h

l0000000000005E03:
	cmp	dword ptr [rbp-34h],7FFFh
	jbe	5C48h

l0000000000005E10:
	mov	rax,[00000000000092E0]                                 ; [rip+000034C9]
	mov	rsi,rax
	mov	edi,0Ah
	call	21A0h
	nop
	lea	rsp,[rbp-28h]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
0000000000005E34             66 2E 0F 1F 84 00 00 00 00 00 66 90     f.........f.

;; __libc_csu_init: 0000000000005E40
__libc_csu_init proc
	endbr64
	push	r15
	lea	r15,[0000000000008C70]                                 ; [rip+00002E23]
	push	r14
	mov	r14,rdx
	push	r13
	mov	r13,rsi
	push	r12
	mov	r12d,edi
	push	rbp
	lea	rbp,[0000000000008C78]                                 ; [rip+00002E14]
	push	rbx
	sub	rbp,r15
	sub	rsp,8h
	call	2000h
	sar	rbp,3h
	jz	5E96h

l0000000000005E77:
	xor	ebx,ebx
	nop	dword ptr [rax+0h]

l0000000000005E80:
	mov	rdx,r14
	mov	rsi,r13
	mov	edi,r12d
	call	qword ptr [r15+rbx*8]
	add	rbx,1h
	cmp	rbp,rbx
	jnz	5E80h

l0000000000005E96:
	add	rsp,8h
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
0000000000005EA5                66 66 2E 0F 1F 84 00 00 00 00 00      ff.........

;; __libc_csu_fini: 0000000000005EB0
__libc_csu_fini proc
	endbr64
	ret
0000000000005EB5                66 2E 0F 1F 84 00 00 00 00 00 90      f..........

;; atexit: 0000000000005EC0
;;   Called from:
;;     00000000000022CC (in __gmon_start__)
atexit proc
	endbr64
	mov	rdx,[0000000000009008]                                 ; [rip+0000313D]
	xor	esi,esi
	jmp	2210h
