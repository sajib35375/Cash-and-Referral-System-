<?php

use Illuminate\Support\Facades\Route;

Route::namespace('User\Auth')->name('user.')->group(function () {
    // User Login and Logout Process
    Route::controller('LoginController')->group(function () {
        Route::get('/login', 'loginForm')->name('login.form');
        Route::post('/login', 'login')->name('login');
        Route::get('logout', 'logout')->middleware('auth')->name('logout');
    });

    // Registration Process
    Route::controller('RegisterController')->group(function(){
        Route::get('register/{reference?}', 'registerForm')->name('register');
        Route::post('register', 'register')->middleware('register.status');
        Route::post('check-user', 'checkUser')->name('check.user');
    });

    // Forgot Password
    Route::controller('ForgotPasswordController')->prefix('password')->name('password.')->group(function() {
        Route::get('forgot', 'requestForm')->name('request.form');
        Route::post('forgot', 'sendResetCode');
        Route::get('verification/form', 'verificationForm')->name('code.verification.form');
        Route::post('verification/form', 'verificationCode');
    });

    // Reset Password
    Route::controller('ResetPasswordController')->prefix('password/reset')->name('password.')->group(function() {
        Route::get('form/{token}', 'resetForm')->name('reset.form');
        Route::post('/', 'resetPassword')->name('reset');
    });
});

Route::middleware('auth')->name('user.')->group(function () {
    Route::namespace('User')->group(function () {
        // Authorization
        Route::controller('AuthorizationController')->group(function(){
            Route::get('authorization', 'authorizeForm')->name('authorization');
            Route::get('resend-verify/{type}', 'sendVerifyCode')->name('send.verify.code');
            Route::post('verify-email', 'emailVerification')->name('verify.email');
            Route::post('verify-mobile', 'mobileVerification')->name('verify.mobile');
            Route::post('verify-g2fa', 'g2faVerification')->name('go2fa.verify');
        });

        // User Operation
        Route::middleware('authorize.status')->group(function () {
            Route::controller('UserController')->group(function() {
                // KYC Dashboard
                Route::get('dashboard', 'home')->name('home');

                // KYC Check
                Route::prefix('kyc')->name('kyc.')->group(function () {
                    Route::get('data', 'kycData')->name('data');
                    Route::get('form', 'kycForm')->name('form');
                    Route::post('form', 'kycSubmit');
                });

                // Profile Update
                Route::get('profile/update', 'profile')->name('profile');
                Route::post('profile/update', 'profileUpdate');

                // Password Change
                Route::get('change/password', 'password')->name('change.password');
                Route::post('change/password', 'passwordChange');

                // 2 Factor Authenticator
                Route::prefix('twofactor')->name('twofactor.')->group(function () {
                    Route::get('/', 'show2faForm')->name('form');
                    Route::post('enable', 'enable2fa')->name('enable');
                    Route::post('disable', 'disable2fa')->name('disable');
                });
                // Report
                Route::get('deposit/history', 'depositHistory')->name('deposit.history');
                Route::get('transactions', 'transactions')->name('transactions');

                // Send money
                Route::controller('SendMoneyController')->group(function() {
                    Route::get('send/money','sendMoney')->name('send.money');
                    Route::post('get/user/data','getUserData')->name('get.data');
                    Route::post('get/user/data/store','getUserDataStore')->name('get.data.store');

                    Route::get('send/money/log','sendMoneyLog')->name('send.money.log');
                });

                // Send money
                Route::controller('CashOutController')->name('cash.out.')->prefix('cashout')->group(function() {
                    Route::get('/','cashOut')->name('view');
                    Route::post('data','cashOutData')->name('data');
                    Route::post('store','cashOutStore')->name('store');

                    Route::get('log','cashOutLog')->name('log');

                    //paid unpaid
                    Route::get('cash/out/paid/{id}','cashOutPaid')->name('paid');
                    Route::get('cash/out/unpaid/{id}','cashOutUnPaid')->name('unpaid');
                });

                // Route::get('file-download/{fileName}','fileDownload')->name('file.download');
                Route::get('file-download','fileDownload')->name('file.download');
            });
        });
    });
});
