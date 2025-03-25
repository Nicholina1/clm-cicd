<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::create([
            'username' => "admin",
            'first_name' => "Default",
            'last_name' => "User",
            'email' => "admin@clms.com",
            'phone' => $faker->numerify('##########'),
            'password' => bcrypt("admin")
        ]);
    }
}
