<?php

// Debug Helper Functions
if (!function_exists("dd_debug")) {
    function dd_debug($data, $label = "Debug") {
        echo "<div style=\"background: #f0f0f0; border: 1px solid #ccc; padding: 10px; margin: 10px;\">";
        echo "<strong>{$label}:</strong><br>";
        echo "<pre>";
        var_dump($data);
        echo "</pre>";
        echo "</div>";
    }
}

if (!function_exists("log_debug")) {
    function log_debug($message, $data = null) {
        \Log::info("DEBUG: " . $message, $data ? ["data" => $data] : []);
    }
}

if (!function_exists("performance_check")) {
    function performance_check($label = "Check") {
        static $startTime = null;
        
        if ($startTime === null) {
            $startTime = microtime(true);
            echo "<div style=\"color: blue;\">[{$label}] Iniciado</div>";
        } else {
            $endTime = microtime(true);
            $duration = ($endTime - $startTime) * 1000;
            echo "<div style=\"color: green;\">[{$label}] Concluído em {$duration}ms</div>";
            $startTime = null;
        }
    }
}

