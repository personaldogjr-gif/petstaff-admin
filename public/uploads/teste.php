<?php
$host = 'db';
$port = 3306;
$dbname = 'gopet';
$user = 'gopet_user';
$password = 'mcH27nR9V*dkLqQFg4zt';

try {
    // Conecta ao banco gopet
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta todos os registros da tabela 'modules'
    $stmt = $pdo->query("SELECT * FROM modules");

    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($results)) {
        echo "Nenhum módulo encontrado.\n";
    } else {
        foreach ($results as $row) {
            echo "--------------------------\n";
            foreach ($row as $column => $value) {
                echo "$column: $value\n";
            }
        }
    }

} catch (PDOException $e) {
    echo "Erro ao acessar a tabela modules: " . $e->getMessage();
}
