<?php

namespace Database\Seeders;

use App\Models\Address;
use App\Models\Branch;
use Illuminate\Database\Seeder;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;

class BranchSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if (env('IS_DUMMY_DATA')) {
            try {
                $branches = [
                    [
                        'address' => [
                            'postal_code' => '544512',
                            'address_line_1' => '123 Main St',
                            'address_line_2' => '',
                            'city' => 'London',
                            'state' => 'Central Square',
                            'country' => 'United Kingdom',
                        ],
                        'name' => 'Pet Care Center',
                        'manager_id' => null,
                        'feature_image' => '/dummy-images/branches/1.png',
                        'contact_email' => 'info@petcare.com',
                        'contact_number' => '2012345678',
                        'payment_method' => ['cash', 'debit_card', 'credit_card', 'upi'],
                        'branch_for' => 'unisex',
                    ]
                ];

                foreach ($branches as $branch) {
                    try {
                        $address = $branch['address'];
                        $featureImage = $branch['feature_image'] ?? null;
                        $branchData = Arr::except($branch, ['feature_image', 'address']);
                        
                        // Criar a filial
                        $br = Branch::create($branchData);
                        Log::info("Filial criada com sucesso: {$br->name} (ID: {$br->id})");
                        
                        // Anexar imagem se disponível
                        if ($featureImage) {
                            $this->attachFeatureImage($br, $featureImage);
                        }
                        
                        // Criar endereço
                        $br->address()->save(new Address($address));
                        Log::info("Endereço criado para filial: {$br->id}");
                        
                        // Criar horários de funcionamento se o módulo estiver disponível
                        $this->createBusinessHours($br);
                        
                    } catch (\Exception $e) {
                        Log::error("Erro ao criar filial: " . $e->getMessage());
                        throw $e;
                    }
                }
                
                Log::info("BranchSeeder executado com sucesso!");
                
            } catch (\Exception $e) {
                Log::error("Erro fatal no BranchSeeder: " . $e->getMessage());
                throw $e;
            }
        } else {
            Log::info("BranchSeeder não executado - IS_DUMMY_DATA não está habilitado");
        }
    }
    
    private function attachFeatureImage($model, $imagePath)
    {
        if(!env('IS_DUMMY_DATA_IMAGE')) {
            Log::info("IS_DUMMY_DATA_IMAGE não habilitado, pulando imagem");
            return false;
        }

        try {
            // Usar o caminho correto para Docker
            $fullPath = public_path($imagePath);
            
            if (!file_exists($fullPath)) {
                Log::warning("Imagem não encontrada: {$fullPath}");
                return false;
            }

            $file = new \Illuminate\Http\File($fullPath);
            $media = $model->addMedia($file)->preservingOriginal()->toMediaCollection('feature_image');
            
            Log::info("Imagem anexada com sucesso: {$imagePath}");
            return $media;
            
        } catch (\Exception $e) {
            Log::error("Erro ao anexar imagem: " . $e->getMessage());
            return false;
        }
    }
    
    private function createBusinessHours($branch)
    {
        try {
            // Verificar se o módulo BussinessHour está disponível
            if (!class_exists('\Modules\BussinessHour\Models\BussinessHour')) {
                Log::info("Módulo BussinessHour não disponível, pulando horários de funcionamento");
                return;
            }
            
            $days = [
                ['day' => 'monday', 'start_time' => '09:00:00', 'end_time' => '18:00:00', 'is_holiday' => false, 'breaks' => []],
                ['day' => 'tuesday', 'start_time' => '09:00:00', 'end_time' => '18:00:00', 'is_holiday' => false, 'breaks' => []],
                ['day' => 'wednesday', 'start_time' => '09:00:00', 'end_time' => '18:00:00', 'is_holiday' => false, 'breaks' => []],
                ['day' => 'thursday', 'start_time' => '09:00:00', 'end_time' => '18:00:00', 'is_holiday' => false, 'breaks' => []],
                ['day' => 'friday', 'start_time' => '09:00:00', 'end_time' => '18:00:00', 'is_holiday' => false, 'breaks' => []],
                ['day' => 'saturday', 'start_time' => '09:00:00', 'end_time' => '18:00:00', 'is_holiday' => false, 'breaks' => []],
                ['day' => 'sunday', 'start_time' => '09:00:00', 'end_time' => '18:00:00', 'is_holiday' => true, 'breaks' => []],
            ];
            
            foreach ($days as $day) {
                $day['branch_id'] = $branch->id;
                \Modules\BussinessHour\Models\BussinessHour::create($day);
            }
            
            Log::info("Horários de funcionamento criados para filial: {$branch->id}");
            
        } catch (\Exception $e) {
            Log::warning("Erro ao criar horários de funcionamento: " . $e->getMessage());
            // Não falhar se os horários não puderem ser criados
        }
    }
}
