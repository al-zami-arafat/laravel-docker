<?php

use Illuminate\Support\Facades\Route;

Route::get('/users', function () {
    $users = \App\Models\User::all();
    return response()->json($users);
});

Route::get('/test', function () {
    return response()->json("fdsfds");
});
