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

#1 - Hello World <br>
#2 - Declaração de variáveis em Assembly <br>
#3 - Exibindo String<br>
#4 - Soma de dois inteiros em Assembly <br>

## Link Úteis

[Site NASM](https://www.nasm.us/)

