<?php

namespace Modules\Currency\database\seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Modules\Currency\Models\Currency;

class CurrencyDatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        // ALWAYS create default currency (required for system to work)
        $defaultCurrency = Currency::where('is_primary', 1)->first();
        if (!$defaultCurrency) {
            Currency::create([
                'currency_name' => 'Real Brasileiro',
                'currency_symbol' => 'R$',
                'currency_code' => 'BRL',
                'currency_position' => 'left',
                'no_of_decimal' => 2,
                'thousand_separator' => '.',
                'decimal_separator' => ',',
                'is_primary' => 1,
            ]);
        }

        // Additional currencies only with IS_DUMMY_DATA
        if (env('IS_DUMMY_DATA')) {
            $currencies = [
                [
                    'currency_name' => 'Dollar',
                    'currency_symbol' => '$',
                    'currency_code' => 'USD',
                    'currency_position' => 'left',
                    'no_of_decimal' => 2,
                    'thousand_separator' => ',',
                    'decimal_separator' => '.',
                    'is_primary' => 0,
                ],
            ];

            foreach ($currencies as $value) {
                $exists = Currency::where('currency_code', $value['currency_code'])->first();
                if (!$exists) {
                    Currency::create($value);
                }
            }
        }

        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
