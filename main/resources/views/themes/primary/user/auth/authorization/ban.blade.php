@extends($activeTheme. 'layouts.app')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="text-end">
                    <a href="{{ route('home') }}" class="fw-bold home-link"> <i class="las la-long-arrow-alt-left"></i> @lang('Go to Home')</a>
                </div>
                <div class="card custom--card">
                    <div class="card-header">
                        <h5 class="card-title text-danger">@lang('You are banned')</h5>
                    </div>
                    <div class="card-body">
                        <p class="fw-bold mb-1">@lang('Reason'):</p>
                        <p>{{ $user->ban_reason }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
