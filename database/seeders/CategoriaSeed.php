<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class CategoriaSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('categorias')->insert([
            'nombre'=>'Pastor',
            'slug'=>Str::slug('Pastor'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('categorias')->insert([
            'nombre'=>'Suadero',
            'slug'=>Str::slug('Suadero'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('categorias')->insert([
            'nombre'=>'Bistec',
            'slug'=>Str::slug('Bistec'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('categorias')->insert([
            'nombre'=>'Cabeza',
            'slug'=>Str::slug('Cabeza'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('categorias')->insert([
            'nombre'=>'Carnitas',
            'slug'=>Str::slug('Carnitas'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('categorias')->insert([
            'nombre'=>'Lengua',
            'slug'=>Str::slug('Lengua'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);
        DB::table('categorias')->insert([
            'nombre'=>'Arrachera',
            'slug'=>Str::slug('Arrachera'),
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()

        ]);

    }
}
