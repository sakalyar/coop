; Fichier asm obtenu à partir d'un fichier latex 

	const ax,main
	jmp ax

:div_err_str
@string "Erreur : Division par 0 impossible\n"

:div_err
	const ax,div_err_str
	callprintfs ax
	end

:ou
; Récupérez la variable a et placez-la en haut de la pile
	const ax,2
	const bx,2
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
; Récupérez la variable b et placez-la en haut de la pile
	const ax,2
	const bx,2
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
; Debut comparaison avec l'operateur OU_0 
	pop ax
	pop bx
	or ax,bx
	const bx,0
	const cx,ou_0
	cmp ax,bx
	jmpc cx
; Faux cas (ID: 0)
	const ax,1
	push ax
	const ax,fin_ou_0
	jmp ax
; Cas Vrai (ID: 0)
:ou_0
	const ax,0
	push ax
; Fin comparaison de l' operateur OU_0
:fin_ou_0
	pop ax
	ret

:main
; initialistaion de la pile
	const bp,stack
	const sp,stack
	const ax,2
	sub sp,ax
; construction des parametres
	const ax,0
	push ax
	const ax,0
	push ax
	const ax,1
	push ax
	const ax,1
	push ax
	const ax,0
	push ax
	const ax,0
	push ax
; Appel de la founction ou
	const ax,ou
	call ax
;recuperer le resultat et affiche le
	push ax
	cp ax,sp
	callprintfd ax
	end
:stack
@int 0
