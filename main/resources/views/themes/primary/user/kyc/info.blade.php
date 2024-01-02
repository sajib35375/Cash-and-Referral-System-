@extends($activeTheme. 'layouts.auth')
@section('auth')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card custom--card">
                    <div class="card-header">
                        <h5 class="card-title">{{ __($pageTitle) }}</h5>
                    </div>
                    <div class="card-body">
                        @if($user->kyc_data)
                            <ul class="list-group">
                                @foreach($user->kyc_data as $val)
                                    @continue(!$val->value)
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        {{__($val->name)}}
                                        <span>
                                            @if($val->type == 'checkbox')
                                                {{ implode(',',$val->value) }}
                                            @elseif($val->type == 'file')
                                                <a href="{{ route('user.file.download') }}?filePath=verify&fileName={{ $val->value }}" class="me-3"><i class="las la-file-download"></i>  @lang('Attachment') </a>
                                            @else
                                                <p>{{__($val->value)}}</p>
                                            @endif
                                        </span>
                                    </li>
                                @endforeach
                            </ul>
                        @else
                            <h5 class="text-center">@lang('KYC data not found')</h5>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection