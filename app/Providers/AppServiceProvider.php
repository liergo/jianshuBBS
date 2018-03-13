<?php

namespace App\Providers;


use App\Models\Topic;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()             //在所有的服务使用完调用
    {
        //
        Schema::defaultStringLength(191);

        View::composer('layouts.sidebar', function ($view) {
            $topics = Topic::all();
            $view->with('topics', $topics);
        });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
