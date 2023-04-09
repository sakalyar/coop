; Fichier asm obtenu à partir d'un fichier latex 

	const ax,main
	jmp ax

:div_err_str
@string "Erreur : Division par 0 impossible\n"

:div_err
	const ax,div_err_str
	callprintfs ax
	end

:factorielle
; Récupérez la variable n et placez-la en haut de la pile
	const ax,2
	const bx,1
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
; Nombre 0
	const ax,0
; Pousser une variable temporaire sur la pile
	push ax
; Debut comparaison egal_0 
	pop ax
	pop bx
	const cx,egal_0
	cmp ax,bx
	jmpc cx
; Cas faux (ID: 0)
	const ax,0
	push ax
	const ax,fin_egal_0
	jmp ax
; Cas vrai(ID: 0)
:egal_0
	const ax,1
	push ax
; Fin comparaison (egal_0) 
:fin_egal_0
	pop ax
	const bx,0
	const cx,else_1
	cmp ax,bx
	jmpc cx

; Nombre 1
	const ax,1
; Pousser une variable temporaire sur la pile
	push ax
	pop ax
	ret
	const ax,fin_if_1
	jmp ax
:else_1

:fin_if_1
; Récupérez la variable n et placez-la en haut de la pile
	const ax,2
	const bx,1
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
; Récupérez la variable n et placez-la en haut de la pile
	const ax,2
	const bx,2
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
; Nombre 1
	const ax,1
; Pousser une variable temporaire sur la pile
	push ax
; Soustraire deux expressions
	pop ax
	pop bx
	sub bx,ax
; Pousser une variable temporaire sur la pile
	push bx
; Appel de la fonction  factorielle
	const bx,factorielle
	call bx
; Pop les arguments de la fonction appelée
	pop dx
; Pousser une variable temporaire sur la pile
	push ax
; Multiplier deux expressions
	pop ax
	pop bx
	mul ax,bx
; Pousser une variable temporaire sur la pile
	push ax
	pop ax
	ret

:main
; initialistaion de la pile
	const bp,stack
	const sp,stack
	const ax,2
	sub sp,ax
; construction des parametres
	const ax,5
	push ax
; Appel de la founction factorielle
	const ax,factorielle
	call ax
;recuperer le resultat et affiche le
	push ax
	cp ax,sp
	callprintfd ax
	end
:stack
@int 0
