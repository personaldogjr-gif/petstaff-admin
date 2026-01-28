<?php

namespace App\Currency;

use Modules\Currency\Models\Currency;

class CurrencyChange
{
    public $defaultCurrency;

    public $currencyList;

    public function __construct()
    {
        $this->currencyList = Currency::getAllCurrency();

        $this->defaultCurrency = $this->currencyList->where('is_primary', 1)->first();

        // Se não houver moeda primária, usar a primeira disponível ou criar uma padrão
        if (!$this->defaultCurrency) {
            $this->defaultCurrency = $this->currencyList->first();
            
            // Se ainda não houver nenhuma moeda, criar uma padrão
            if (!$this->defaultCurrency) {
                $this->defaultCurrency = (object) [
                    'currency_symbol' => 'R$',
                    'no_of_decimal' => 2,
                    'decimal_separator' => ',',
                    'thousand_separator' => '.',
                    'currency_position' => 'left'
                ];
            }
        }
    }

    public function getDefaultCurrency($array = false)
    {
        if (!$this->defaultCurrency) {
            return $array ? [] : null;
        }

        if ($array) {
            // Handle both Eloquent models and stdClass objects
            if (method_exists($this->defaultCurrency, 'toArray')) {
                return $this->defaultCurrency->toArray();
            }
            return (array) $this->defaultCurrency;
        }

        return $this->defaultCurrency;
    }

    public function defaultSymbol()
    {
        return $this->defaultCurrency->currency_symbol ?? 'R$';
    }

    public function format($amount)
    {
        if (!$this->defaultCurrency) {
            return 'R$ ' . number_format($amount, 2, ',', '.');
        }

        $noOfDecimal = $this->defaultCurrency->no_of_decimal ?? 2;
        $decimalSeparator = $this->defaultCurrency->decimal_separator ?? ',';
        $thousandSeparator = $this->defaultCurrency->thousand_separator ?? '.';
        $currencyPosition = $this->defaultCurrency->currency_position ?? 'left';
        $currencySymbol = $this->defaultCurrency->currency_symbol ?? 'R$';

        return formatCurrency($amount, $noOfDecimal, $decimalSeparator, $thousandSeparator, $currencyPosition, $currencySymbol);
    }
}
