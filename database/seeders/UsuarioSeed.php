<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class UsuarioSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name'=>'Victor',
            'email'=>'correo@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Juan',
            'email'=>'correo1@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Juan',
            'email'=>'correo2@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Ramon',
            'email'=>'correo3@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Zaira',
            'email'=>'correo4@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Penny',
            'email'=>'correo5@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Ramon',
            'email'=>'correo6@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Veronica',
            'email'=>'correo7@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Alfredo',
            'email'=>'correo8@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Manuel',
            'email'=>'correo9@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Victor',
            'email'=>'correo10@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Juan',
            'email'=>'correo11@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Fernando',
            'email'=>'correo12@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('users')->insert([
            'name'=>'Paloma',
            'email'=>'correo13@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
         DB::table('users')->insert([
            'name'=>'Alicia',
            'email'=>'correo14@correo.com',
            'email_verified_at'=>Carbon::now(),
            'password'=>Hash::make('123456789'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
    }
}
