@extends('admin.layouts.app')
@section('content')
    <div class="authentication-wrapper authentication-cover">
        <div class="authentication-inner row m-0">
            <div class="d-none d-lg-flex col-lg-7 col-xl-8 align-items-center p-5">
                <div class="w-100 d-flex justify-content-center">
                    <img src="{{ asset('assets/admin/images/login.png') }}" class="img-fluid" alt="Login image" width="700">
                </div>
            </div>

            <div class="d-flex col-12 col-lg-5 col-xl-4 align-items-center authentication-bg p-sm-5 p-4">
                <div class="w-px-400 mx-auto">
                    <div class="text-center">
                        <h4 class="mb-2">
                            Welcome to Phinix Admin
                            <img src="{{ asset('assets/admin/images/wave.gif') }}" alt="emoji" class="animated-emoji">
                        </h4>
                        <p class="mb-4">@lang('Please sign-in to your account')</p>
                    </div>

                    <form class="mb-3 verify-gcaptcha" action="{{ route('admin.login') }}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label class="form-label">@lang('Username')e</label>
                            <input value="admin" type="text" class="form-control" name="username"value="{{ old('username') }}" placeholder="@lang('Enter your username')" required autofocus>
                        </div>
                        <div class="mb-3 form-password-toggle">
                            <label class="form-label">@lang('Password')</label>

                            <div class="input-group">
                                <input value="admin" type="password" class="form-control" name="password" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" required>
                                <span aria-valuemax="" class="input-group-text cursor-pointer"><i class="las la-eye-slash"></i></span>
                            </div>
                        </div>
                        <x-captcha />
                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <div class="form-check">
                                    <input class="form-check-input" name="remember" type="checkbox" id="remember">
                                    <label class="form-check-label" for="remember">@lang('Remember Me')</label>
                                </div>
                                <a href="{{ route('admin.password.request.form') }}">
                                    <small>@lang('Forgot Password?')</small>
                                </a>
                            </div>
                        </div>
                        <button class="btn btn-primary d-grid w-100" type="submit">@lang('Sign in')</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('page-style-lib')
    <link rel="stylesheet" href="{{asset('assets/admin/css/page/auth.css')}}">
@endpush
