global _start

section .data
    arr db 3, 4, 1, 2, 5

section .text

; al = miejsce na 1 porównany slot
; bl = miejsce na 2 porównany slot
; rcx = licznik do wskazywania pozycji w tabeli
; rdx = licznik liczący przypadki bez sortowania

zamiana:  ;zamieniamy miejscami w tablicy
    mov [arr+rcx], bl
    mov [arr+rcx+1], al

    jmp koniec_zamiany

_start:

    reset:  ;resetujemy liczniki
        mov rcx, 0
        mov rdx, 0
        jmp sort


    sort:

        mov al, [arr+rcx]  ; ustawiamy indeks n
        mov bl, [arr+rcx+1] ; ustawiamy indeks n+1

        cmp al, bl  ; porównujemy al, bl
        jg zamiana ; jeżeli al < bl to zamieniamy je miejscami

        add rdx, 1 ;w przypadku gdy nie zmieni dodaje do licznika przypadków gdy nie zmieniliśmy

        cmp rdx, 5 ; jeżeli nie zmieniliśmy nic w pętli ani razu
        je end ; kończymy sortowanie

        koniec_zamiany: ; inkrementuje pętle oraz sprawdza czy musimy pójść na początek
            add rcx, 1
            cmp rcx, 5
            je reset
            jmp sort
            
        end:
            mov al, [arr]
            mov al, [arr+1]
            mov al, [arr+2]
            mov al, [arr+3]
            mov al, [arr+4]

    mov rax, 60
    xor rdi, rdi
    syscall

