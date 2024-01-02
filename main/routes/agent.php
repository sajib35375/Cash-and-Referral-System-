<?php

use Illuminate\Support\Facades\Route;

Route::namespace('Agent\Auth')->name('agent.')->group(function () {
    // Agent Login and Logout Process
    Route::controller('LoginController')->group(function () {
        Route::get('login','loginForm')->name('login.form');
        Route::post('login', 'agentLogin')->name('login');
        Route::get('logout', 'logout')->middleware('agent')->name('logout');
    });

     // Agent Registration
     Route::controller('RegisterController')->group(function () {
        Route::get('register','registerForm')->name('register');
        Route::post('register','register')->middleware('register.status');
        Route::post('check-agent', 'checkAgent')->name('check');
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


Route::middleware('agent')->name('agent.')->group(function () {
    Route::namespace('Agent')->group(function () {
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
            Route::controller('AgentController')->group(function () {
                // Dashboard
                Route::get('dashboard','dashboard')->name('dashboard');

                // Profile Update
                Route::get('profile/update', 'profile')->name('profile');
                Route::post('profile/update', 'profileUpdate');

                // Password Change
                Route::get('change/password', 'password')->name('change.password');
                Route::post('change/password', 'passwordChange');

                // KYC Check
                Route::get('kycForm','KycForm')->name('kyc.form');
                Route::post('kycForm','kycSubmit')->name('kyc.form.submit');
                Route::get('data Kyc', 'kycData')->name('kyc.data');

                // file dwonload
                Route::get('file-download','fileDownload')->name('file.download');

                // Report
                Route::get('deposit/history', 'depositHistory')->name('deposit.history');
                Route::get('transactions', 'transactions')->name('transactions');

                // 2 Factor Authenticator
                Route::prefix('twofactor')->name('twofactor.')->group(function () {
                    Route::get('/', 'show2faForm')->name('form');
                    Route::post('enable', 'enable2fa')->name('enable');
                    Route::post('disable', 'disable2fa')->name('disable');
                });
            });
        });
    });

    // Deposit
    Route::middleware('authorize.status')->prefix('deposit')->name('deposit.')->controller('Gateway\PaymentController')->group(function(){
        Route::any('/', 'deposit')->name('index');
        Route::post('insert', 'depositInsert')->name('insert');
        Route::get('confirm', 'depositConfirm')->name('confirm');
        Route::get('manual', 'manualDepositConfirm')->name('manual.confirm');
        Route::post('manual', 'manualDepositUpdate')->name('manual.update');
    });

    // Withdraw
    Route::controller('Agent\WithdrawController')->prefix('withdraw')->name('withdraw.')->group(function(){
        Route::middleware('authorize.status')->group(function() {
            Route::get('/', 'withdraw')->name('index');
            Route::post('/', 'store');
            Route::get('preview', 'preview')->name('preview');
            Route::post('preview', 'submit');
        });
        Route::get('history', 'history')->name('history');
    });

    // cash in cash out
    Route::controller('Agent\CashInController')->prefix('cash-in-cash-out')->name('cash.')->group(function(){
        Route::middleware('authorize.status')->group(function() {
            Route::get('/', 'CashIn')->name('view');
            Route::post('data', 'cashInData')->name('in.data');
            Route::post('cash/in/balance/store', 'cashInBalanceStore')->name('balance.store');

            Route::get('agent/cash/in/log','cashInLog')->name('in.log');
            Route::get('user/cash/in/log','userCashInLog')->name('user.log');

        });
    });
    // cash in cash out
    Route::controller('Agent\CashOutController')->prefix('cash-in-cash-out')->name('cash.')->group(function() {
        Route::middleware('authorize.status')->group(function () {
            Route::get('cashOut/log','cashOutLog')->name('out.log');
            Route::get('cashOut/paid/{id}','cashOutPaid')->name('out.paid');
        });
    });
});

