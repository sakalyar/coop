; Fichier asm obtenu à partir d'un fichier latex 

	const ax,main
	jmp ax

:div_err_str
@string "Erreur : Division par 0 impossible\n"

:div_err
	const ax,div_err_str
	callprintfs ax
	end

:puissance
; Nombre 1
	const ax,1
; Pousser une variable temporaire sur la pile
	push ax
; Add the p variable in the stack
	pop ax
	push ax
; Début de la boucle do while
:while_0
	pop ax
	const bx,0
	const cx,fin_while_0
	cmp ax,bx
	jmpc cx
