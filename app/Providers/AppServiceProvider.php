<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class 
AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {

    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        if (config('app.env') === 'production') {
            \URL::forceScheme('https');
        }

        if (config('database.default') === 'pgsql') {
            \Illuminate\Support\Facades\DB::statement("SET datestyle TO 'ISO, YMD'");
        }
    }
}
