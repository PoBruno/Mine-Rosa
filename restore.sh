#!/bin/bash

# Diretório de backup
backup_dir="./backup"

# Verifica se o diretório de backup existe
if [ ! -d "$backup_dir" ]; then
    echo "Diretório de backup $backup_dir não encontrado."
    exit 1
fi

# Verifica se o diretório ./data/ existe e, se sim, o exclui
if [ -d "./data" ]; then
    echo "Excluindo o diretório ./data/ existente..."
    rm -rf ./data
fi

# Concatena as partes divididas do arquivo de backup em um único arquivo
cat "$backup_dir"/data_split_* > "$backup_dir/data.tar.gz"

# Extrai o arquivo de backup para a pasta raiz
tar -xzvf "$backup_dir/data.tar.gz"

echo "Restauração concluída na pasta raiz."

