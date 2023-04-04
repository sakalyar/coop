;;; Segment .plt.sec (0000000000002150)

;; fn0000000000002150: 0000000000002150
;;   Called from:
;;     0000000000005945 (in main)
fn0000000000002150 proc
	endbr64
	repne jmp	[0000000000008F30]                               ; [rip+00006DD5]
000000000000215B                                  0F 1F 44 00 00            ..D..

;; fn0000000000002160: 0000000000002160
;;   Called from:
;;     00000000000059A5 (in main)
fn0000000000002160 proc
	endbr64
	repne jmp	[0000000000008F38]                               ; [rip+00006DCD]
000000000000216B                                  0F 1F 44 00 00            ..D..

;; fn0000000000002170: 0000000000002170
;;   Called from:
;;     000000000000272B (in shiftr_f)
;;     0000000000002851 (in shiftl_f)
;;     00000000000029AE (in and_f)
;;     0000000000002B0B (in or_f)
;;     0000000000002C68 (in xor_f)
;;     0000000000002D6B (in not_f)
;;     000000000000305A (in add_f)
;;     0000000000003428 (in sub_f)
;;     00000000000035DE (in mul_f)
;;     0000000000003882 (in div_f)
;;     00000000000039E5 (in cp_f)
;;     0000000000003B4C (in loadw_f)
;;     0000000000003CB2 (in storew_f)
;;     0000000000003E25 (in loadb_f)
;;     0000000000003F8E (in storeb_f)
;;     00000000000040E4 (in const_f)
;;     00000000000041F9 (in push_f)
;;     000000000000432E (in pop_f)
;;     00000000000044F5 (in cmp_f)
;;     0000000000004657 (in uless_f)
;;     00000000000047CC (in sless_f)
;;     000000000000488E (in jmp_f)
;;     000000000000495F (in jmpz_f)
;;     0000000000004A30 (in jmpc_f)
;;     0000000000004B01 (in jmpe_f)
;;     0000000000004C06 (in call_f)
;;     0000000000004D50 (in callprintfd_f)
;;     0000000000004E58 (in callprintfu_f)
;;     0000000000004F57 (in callprintfs_f)
;;     0000000000005093 (in callscanfd_f)
;;     00000000000051B9 (in callscanfu_f)
;;     0000000000005387 (in callscanfs_f)
;;     0000000000005579 (in printSIPRO)
;;     0000000000005721 (in execute)
fn0000000000002170 proc
	endbr64
	repne jmp	[0000000000008F40]                               ; [rip+00006DC5]
000000000000217B                                  0F 1F 44 00 00            ..D..

;; fn0000000000002180: 0000000000002180
;;   Called from:
;;     0000000000004D28 (in callprintfd_f)
;;     0000000000004E30 (in callprintfu_f)
;;     0000000000004F2F (in callprintfs_f)
fn0000000000002180 proc
	endbr64
	repne jmp	[0000000000008F48]                               ; [rip+00006DBD]
000000000000218B                                  0F 1F 44 00 00            ..D..

;; fn0000000000002190: 0000000000002190
;;   Called from:
;;     0000000000005BEC (in loadMemoryFromFile)
fn0000000000002190 proc
	endbr64
	repne jmp	[0000000000008F50]                               ; [rip+00006DB5]
000000000000219B                                  0F 1F 44 00 00            ..D..

;; fn00000000000021A0: 00000000000021A0
;;   Called from:
;;     00000000000054C4 (in printSIPRO)
;;     0000000000005564 (in printSIPRO)
;;     0000000000005E1F (in dumpMemory)
fn00000000000021A0 proc
	endbr64
	repne jmp	[0000000000008F58]                               ; [rip+00006DAD]
00000000000021AB                                  0F 1F 44 00 00            ..D..

;; fn00000000000021B0: 00000000000021B0
;;   Called from:
;;     00000000000052FF (in callscanfs_f)
fn00000000000021B0 proc
	endbr64
	repne jmp	[0000000000008F60]                               ; [rip+00006DA5]
00000000000021BB                                  0F 1F 44 00 00            ..D..

;; fn00000000000021C0: 00000000000021C0
;;   Called from:
;;     00000000000022BC (in __gmon_start__)
fn00000000000021C0 proc
	endbr64
	repne jmp	[0000000000008F68]                               ; [rip+00006D9D]
00000000000021CB                                  0F 1F 44 00 00            ..D..

;; fn00000000000021D0: 00000000000021D0
;;   Called from:
;;     0000000000002407 (in setCarry)
;;     0000000000002477 (in setError)
;;     00000000000024E7 (in setZero)
;;     0000000000002686 (in shiftr_f)
;;     00000000000027A7 (in shiftl_f)
;;     000000000000290B (in and_f)
;;     0000000000002A68 (in or_f)
;;     0000000000002BC5 (in xor_f)
;;     0000000000002CE4 (in not_f)
;;     0000000000002FB8 (in add_f)
;;     0000000000003135 (in sub_f)
;;     00000000000034E8 (in mul_f)
;;     000000000000369E (in div_f)
;;     0000000000003961 (in cp_f)
;;     0000000000003ABF (in loadw_f)
;;     0000000000003C26 (in storew_f)
;;     0000000000003D8C (in loadb_f)
;;     0000000000003EFF (in storeb_f)
;;     000000000000401A (in const_f)
;;     0000000000004170 (in push_f)
;;     0000000000004285 (in pop_f)
;;     0000000000004408 (in cmp_f)
;;     00000000000045CF (in uless_f)
;;     0000000000004732 (in sless_f)
;;     000000000000484D (in jmp_f)
;;     000000000000490A (in jmpz_f)
;;     00000000000049DB (in jmpc_f)
;;     0000000000004AAC (in jmpe_f)
;;     0000000000004B7D (in call_f)
;;     0000000000004CBD (in callprintfd_f)
;;     0000000000004DCC (in callprintfu_f)
;;     0000000000004ED4 (in callprintfs_f)
;;     0000000000004FD3 (in callscanfd_f)
;;     000000000000510F (in callscanfu_f)
;;     0000000000005293 (in callscanfs_f)
;;     000000000000548D (in printSIPRO)
;;     0000000000005546 (in printSIPRO)
;;     0000000000005634 (in execute)
;;     0000000000005693 (in execute)
;;     00000000000056DB (in execute)
;;     000000000000579E (in usage)
;;     0000000000005986 (in main)
;;     0000000000005DF6 (in dumpMemory)
fn00000000000021D0 proc
	endbr64
	repne jmp	[0000000000008F70]                               ; [rip+00006D95]
00000000000021DB                                  0F 1F 44 00 00            ..D..

;; fn00000000000021E0: 00000000000021E0
;;   Called from:
;;     0000000000005BDC (in loadMemoryFromFile)
fn00000000000021E0 proc
	endbr64
	repne jmp	[0000000000008F78]                               ; [rip+00006D8D]
00000000000021EB                                  0F 1F 44 00 00            ..D..

;; fn00000000000021F0: 00000000000021F0
;;   Called from:
;;     0000000000005935 (in main)
fn00000000000021F0 proc
	endbr64
	repne jmp	[0000000000008F80]                               ; [rip+00006D85]
00000000000021FB                                  0F 1F 44 00 00            ..D..

;; fn0000000000002200: 0000000000002200
;;   Called from:
;;     00000000000058FF (in main)
fn0000000000002200 proc
	endbr64
	repne jmp	[0000000000008F88]                               ; [rip+00006D7D]
000000000000220B                                  0F 1F 44 00 00            ..D..

l0000000000002210:
	endbr64
	repne jmp	[0000000000008F90]                               ; [rip+00006D75]
000000000000221B                                  0F 1F 44 00 00            ..D..

;; fn0000000000002220: 0000000000002220
;;   Called from:
;;     0000000000005009 (in callscanfd_f)
;;     0000000000005145 (in callscanfu_f)
fn0000000000002220 proc
	endbr64
	repne jmp	[0000000000008F98]                               ; [rip+00006D6D]
000000000000222B                                  0F 1F 44 00 00            ..D..

;; fn0000000000002230: 0000000000002230
;;   Called from:
;;     0000000000002411 (in setCarry)
;;     0000000000002481 (in setError)
;;     00000000000024F1 (in setZero)
;;     00000000000058E7 (in main)
;;     0000000000005A10 (in readByte)
;;     0000000000005A74 (in writeByte)
;;     0000000000005ADE (in readWord)
;;     0000000000005B6C (in writeWord)
fn0000000000002230 proc
	endbr64
	repne jmp	[0000000000008FA0]                               ; [rip+00006D65]
000000000000223B                                  0F 1F 44 00 00            ..D..

;; fn0000000000002240: 0000000000002240
;;   Called from:
;;     0000000000005782 (in usage)
;;     00000000000057BB (in usage)
;;     00000000000057D8 (in usage)
;;     00000000000057F5 (in usage)
;;     0000000000005812 (in usage)
;;     000000000000582F (in usage)
;;     0000000000005A06 (in readByte)
;;     0000000000005A6A (in writeByte)
;;     0000000000005AD4 (in readWord)
;;     0000000000005B62 (in writeWord)
fn0000000000002240 proc
	endbr64
	repne jmp	[0000000000008FA8]                               ; [rip+00006D5D]
000000000000224B                                  0F 1F 44 00 00            ..D..

;; fn0000000000002250: 0000000000002250
;;   Called from:
;;     000000000000594E (in main)
fn0000000000002250 proc
	endbr64
	repne jmp	[0000000000008FB0]                               ; [rip+00006D55]
000000000000225B                                  0F 1F 44 00 00            ..D..
