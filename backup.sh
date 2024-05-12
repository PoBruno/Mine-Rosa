#!/bin/bash

# Diretório de backup
backup_dir="./backup"
backup_file="$backup_dir/data.tar.gz"

# Verifica se o diretório de backup existe e, se não, cria-o
mkdir -p "$backup_dir"

# Verifica se o diretório de backup não está vazio e, se não, exclui todos os arquivos dentro dele
if [ "$(ls -A $backup_dir)" ]; then
    echo "Apagando arquivos existentes dentro de $backup_dir..."
    rm -rf "$backup_dir"/*
fi

# Compacta o conteúdo da pasta ./data/ para ./backup/data.tar.gz
tar -czf "$backup_file" ./data/*

# Verifica se a compactação foi bem-sucedida
if [ $? -eq 0 ]; then
    echo "Compactação do arquivo concluída com sucesso."
else
    echo "Erro ao compactar o arquivo."
    exit 1
fi

# Divide o arquivo data.tar.gz em partes menores
#split -b 80M "$backup_file" "$backup_dir/data_split_"

# Verifica se a divisão foi bem-sucedida
#if [ $? -eq 0 ]; then
#    echo "Divisão do arquivo concluída com sucesso."
#else
#    echo "Erro ao dividir o arquivo."
#    exit 1
#fi

# Verifica se o arquivo original data.tar.gz foi excluído e, se não, força a exclusão
#if [ -f "$backup_file" ]; then
#    echo "Forçando a exclusão do arquivo original data.tar.gz..."
#    rm -rf "$backup_file"
#fi

echo "Backup concluído com sucesso."

