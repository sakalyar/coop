; Fichier asm obtenu à partir d'un fichier latex 

	const ax,main
	jmp ax

:div_err_str
@string "Erreur : Division par 0 impossible\n"

:div_err
	const ax,div_err_str
	callprintfs ax
	end

:while
; Nombre 5
	const ax,5
; Pousser une variable temporaire sur la pile
	push ax
; Récupérez la variable n et placez-la en haut de la pile
	const ax,2
	const bx,2
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
	pop ax
	pop dx
	ret

:main
; initialistaion de la pile
	const bp,stack
	const sp,stack
	const ax,2
	sub sp,ax
; construction des parametres
	const ax,2
	push ax
; Appel de la founction while
	const ax,while
	call ax
;recuperer le resultat et affiche le
	push ax
	cp ax,sp
	callprintfd ax
	end
:stack
@int 0
