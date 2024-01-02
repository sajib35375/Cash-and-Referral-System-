@extends($activeTheme. 'layouts.app')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-7 col-xl-5">
                <div class="text-end">
                    <a href="{{ route('home') }}" class="fw-bold home-link"> <i class="las la-long-arrow-alt-left"></i> @lang('Go to Home')</a>
                </div>
                <div class="card custom--card shadow bdr">
                    <div class="card-header head">
                        <h5 class="card-title">{{ __($pageTitle) }}</h5>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="{{ route('user.password.reset') }}">
                            @csrf
                            <input type="hidden" name="email" value="{{ $email }}">
                            <input type="hidden" name="code" value="{{ $code }}">

                            <div class="form-group">
                                <label class="form-label">@lang('Password')</label>
                                <input type="password" class="form-control form--control @if($setting->strong_pass) secure-password @endif" name="password" required>
                            </div>
                            <div class="form-group">
                                <label class="form-label">@lang('Confirm Password')</label>
                                <input type="password" class="form-control form--control" name="password_confirmation" required>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn--base btn-info w-100"> @lang('Submit')</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@if ($setting->strong_pass)
    @push('page-script-lib')
        <script src="{{asset('assets/universal/js/strong_password.js')}}"></script>
    @endpush
@endif

@push('page-style')
    <style>
        .bdr {
            border: 1px solid #e9e9e9;
        }
        .head {
            background-color: #000;
        }
        .head h5 {
            color: #fff;
        }
    </style>
@endpush
