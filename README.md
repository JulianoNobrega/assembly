# Códigos em Assembly
Códigos em assembly para uso em aula - Turma de Graduação em Ciência da Computação.<br>
Prof. Ms. Juliano Farias da Nóbrega

## Instruções para montagem do arquivo (NASM Linux)

- Instalar o nasm no Linux: `$ sudo apt-get install nasm`
- Criar o arquivo via nano no formato .asm (Exemplo: $ nano filename.asm)
- Passo 1 - Gerar arquivo objeto (extensão .o): `$ nasm -f elf64 filename.asm`
- Passo 2 - Gerar (MONTAR) o arquivo binário a partir do objeto: `$ ld -s -o filename filename.o`
- Passo 3 - Executar arquivo: `$ ./filename`

## Arquivos disponíveis

#1 - (program1.asm) Hello World <br>
#2 - (program2.asm) Declaração de variáveis em Assembly <br>
#3 - (program3.asm) Exibindo String<br>
#4 - (program4.asm) Soma de dois inteiros em Assembly <br>
#5 - (program5.asm) Uso de saltos condicionais <br>
#6 - (program6.asm) Uso de mais saltos condicionais <br>
#7 - (program7.asm) Uso de saltos para verifica maior entre 3 valores <br>
#8 - (program8.asm) PUSH e POP <br>
#9 - (program9.asm) Loop com PUSH, POP e INC <br>
#10 - (trabalho.asm) Trabalho em Sala de Aula, para comparar valores <br>

## Link Úteis

[Site NASM - Em inglês](https://www.nasm.us/) <br>
[Guia de referência NASM - Em Português](https://mentebinaria.gitbook.io/assembly/) <br>
[Guia de Syscalls - x86 32bits](https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md) <br>
[Emulador Online de Assembly](https://www.jdoodle.com/compile-assembler-nasm-online/) <br>
