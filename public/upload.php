<?php
// Verifica se o arquivo foi enviado sem erros
if (isset($_FILES['file']) && $_FILES['file']['error'] == 0) {
    // Define o diretório de destino onde o arquivo será salvo
    $uploadDir = 'uploads/';

    // Verifica se o diretório de uploads existe, se não, cria
    if (!file_exists($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    // Obtém informações sobre o arquivo enviado
    $fileName = $_FILES['file']['name'];
    $fileTmpPath = $_FILES['file']['tmp_name'];
    $fileSize = $_FILES['file']['size'];
    $fileType = $_FILES['file']['type'];

    // Define o caminho completo para salvar o arquivo
    $destino = $uploadDir . basename($fileName);

    // Verifica o tamanho do arquivo (exemplo: máximo 10MB)
    if ($fileSize > 10485760) { // 10MB
        echo "Erro: O arquivo é muito grande. O tamanho máximo permitido é 10MB.";
    } else {
        // Move o arquivo para o diretório de destino
        if (move_uploaded_file($fileTmpPath, $destino)) {
            echo "O arquivo foi enviado com sucesso para: " . $destino;
        } else {
            echo "Erro: O arquivo não pôde ser enviado.";
        }
    }
} else {
    // Se o formulário não foi enviado ou houve um erro no envio
    echo '
    <!DOCTYPE html>
    <html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Upload de Arquivos</title>
    </head>
    <body>
        <h2>Faça o Upload de um Arquivo</h2>
        <form action="" method="POST" enctype="multipart/form-data">
            <label for="file">Escolha o arquivo:</label>
            <input type="file" name="file" id="file" required>
            <br><br>
            <button type="submit">Enviar Arquivo</button>
        </form>
    </body>
    </html>
    ';
}
?>
