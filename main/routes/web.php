<?php

use Illuminate\Support\Facades\Route;

Route::controller('WebsiteController')->group(function () {
    Route::get('/', 'home')->name('home');
    Route::get('placeholder-image/{size}', 'placeholderImage')->name('placeholder.image');

    // Contact
    Route::get('contact', 'contact')->name('contact');
    Route::post('contact', 'contactStore')->name('contact.store');

    // Cookie
    Route::get('cookie/accept', 'cookieAccept')->name('cookie.accept');
    Route::get('cookie-policy', 'cookiePolicy')->name('cookie.policy');

    // Language
    Route::get('change/{lang?}', 'changeLanguage')->name('lang');

    // Policy Details
    Route::get('policy/{slug}/{id}', 'policyPages')->name('policy.pages');

    // blog Details
    Route::get('blog/details/{id}','blogDetails')->name('blog.details');

    // about page
    Route::get('about','about')->name('about');

    // service page
    Route::get('service','service')->name('service');

    // blog page
    Route::get('blog','blog')->name('blog');

    // contact page
    Route::get('contact/us','contactUs')->name('contact.us');
});
