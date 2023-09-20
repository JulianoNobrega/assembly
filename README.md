# Códigos em Assembly
Códigos em assembly para uso em aula - Turma de Graduação em Ciência da Computação.
Prof. Ms. Juliano Farias da Nóbrega

## Instruções para montagem do arquivo (NASM Linux)

- Instalar o nasm no Linux: $ sudo apt-get install nasm
- Criar o arquivo no formato .asm (Exemplo: filename.asm)
- Passo 1 - Gerar arquivo objeto: $ nasm -f elf64 filename.asm
- Passo 2 - Gerar arquivo binário: $ ld -s -o filename filename.o
- Passo 3 - Executar arquivo: $ /.filename

## Arquivos disponíveis

#1 - Hello World.
#2 - Declaração de variáveis em Assembly.
#3 - Programa de soma em Assembly.

