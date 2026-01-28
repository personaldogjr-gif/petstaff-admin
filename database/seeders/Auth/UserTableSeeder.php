<?php

namespace Database\Seeders\Auth;

use App\Events\Backend\UserCreated;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Arr;
use App\Models\Address;
use Illuminate\Support\Facades\Log;

/**
 * Class UserTableSeeder.
 */
class UserTableSeeder extends Seeder
{
    /**
     * Run the database seed.
     *
     * @return void
     */
    public function run()
    {
        $avatarPath = config('app.avatar_base_path');

        Log::info('UserTableSeeder running...');

        // ALWAYS create admin user (required for system to work)
        $adminUser = User::where('email', 'admin@gopet.com')->first();
        if (!$adminUser) {
            $adminUser = User::create([
                'first_name' => 'Super',
                'last_name' => 'Admin',
                'email' => 'admin@gopet.com',
                'password' => Hash::make('12345678'),
                'mobile' => '44-5289568745',
                'date_of_birth' => Carbon::now()->subYears(25)->format('Y-m-d'),
                'avatar' => $avatarPath.'male.png',
                'profile_image' => null,
                'gender' => 'male',
                'email_verified_at' => Carbon::now(),
                'status' => 1,
                'is_banned' => 0,
                'user_type' => 'admin',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
            $adminUser->assignRole('admin');
            Log::info('Admin user created: admin@gopet.com / 12345678');
        } else {
            // Ensure admin has role assigned
            if (!$adminUser->hasRole('admin')) {
                $adminUser->assignRole('admin');
            }
            Log::info('Admin user already exists: ' . $adminUser->email);
        }

        // Only create demo/test users if IS_DUMMY_DATA is enabled
        if (env('IS_DUMMY_DATA')) {
            $users = [
                [
                    'first_name' => 'John',
                    'last_name' => 'Doe',
                    'email' => 'john@gmail.com',
                    'password' => Hash::make('12345678'),
                    'mobile' => '1-4578952512',
                    'date_of_birth' => Carbon::now()->subYears(25)->format('Y-m-d'),
                    'profile_image' => public_path('/dummy-images/profile/owner/Stella.png'),
                    'avatar' => $avatarPath.'male.png',
                    'gender' => 'male',
                    'email_verified_at' => Carbon::now(),
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                    'user_type' => 'user',
                    'address' => [
                        [
                            'postal_code' => '445632',
                            'address_line_1' => '23, Square Street',
                            'address_line_2' => 'Near Sea View Point',
                            'city' =>  10001,
                            'state' => 3866,
                            'country' => 230,
                        ],
                    ]
                ],
            ];

            foreach ($users as $key => $user_data) {
                $existingUser = User::where('email', $user_data['email'])->first();
                if ($existingUser) {
                    Log::info('User already exists, skipping: ' . $user_data['email']);
                    continue;
                }

                $featureImage = $user_data['profile_image'] ?? null;
                $userData = Arr::except($user_data, ['address']);
                $user = User::create($userData);

                if (isset($user_data['address'])) {
                    $addresses = $user_data['address'];
                    foreach($addresses as $addressData){
                        $address = new Address($addressData);
                        $user->address()->save($address);
                    }
                }

                $user->assignRole($user_data['user_type']);
                Log::info('User created: ' . $user->email);
                event(new UserCreated($user));
                
                if (isset($featureImage) && env('IS_DUMMY_DATA_IMAGE')) {
                    $this->attachFeatureImage($user, $featureImage);
                }
            }
        }

        Schema::enableForeignKeyConstraints();
    }

    private function attachFeatureImage($model, $publicPath)
    {
        if(!env('IS_DUMMY_DATA_IMAGE')) return false;

        $file = new \Illuminate\Http\File($publicPath);
        $media = $model->addMedia($file)->preservingOriginal()->toMediaCollection('profile_image');

        return $media;
    }
}
