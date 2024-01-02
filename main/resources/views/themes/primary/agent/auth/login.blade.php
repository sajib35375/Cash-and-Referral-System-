@extends($activeTheme. 'layouts.app')
@section('content')
    <div class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
        <div class="d-flex align-items-center justify-content-center w-100">
            <div class="row justify-content-center w-100">
                <div class="col-md-8 col-lg-6 col-xxl-3">
                    <div class="card mb-0">
                        <div class="card-body">
                            <a href="{{ route('home') }}" class="text-nowrap logo-img text-center d-block py-3 w-100">
                                <img src="{{ getImage(getFilePath('logoFavicon').'/logo.png') }}" width="180" alt="">
                            </a>
                            <p class="text-center text-info">Agent Login</p>
                            <form method="POST" action="" class="verify-gcaptcha">
                                @csrf
                                <div class="mb-3">
                                    <label class="form-label">@lang('Username or Email')</label>
                                    <input type="text" class="form-control" name="username" value="{{ old('username') }}" required>
                                </div>
                                <div class="mb-4">
                                    <label  class="form-label">@lang('Password')</label>
                                    <input id="password" type="password" class="form-control" name="password" required>
                                </div>

                                <x-captcha />

                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div class="form-check">
                                        <input class="form-check-input primary" type="checkbox" id="remember" name="remember" {{ old('remember') ? 'checked' : '' }}>
                                        <label class="form-check-label text-dark" for="remember">
                                            @lang('Remeber this Device')
                                        </label>
                                    </div>
                                    <a class="text-primary fw-bold" href="{{ route('agent.password.request.form') }}">@lang('Forgot your password?')</a>
                                </div>

                                <button type="submit" class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2">@lang('Sign In')</button>

                                <div class="d-flex align-items-center justify-content-center">
                                    <p class="fs-4 mb-0 fw-bold">@lang('Don\'t have any account?')</p>
                                    <a class="text-primary fw-bold ms-2" href="{{ route('agent.register') }}">@lang('Create an account')</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
