@extends($activeTheme. 'layouts.agent')
@section('agent')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card custom--card shadow bdr">
                    <div class="card-header head">
                        <h5 class="card-title">@lang('Withdraw Via') {{ $withdraw->method->name }}</h5>
                    </div>
                    <div class="card-body">
                        <form action="" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="mb-2">
                                @php echo $withdraw->method->guideline; @endphp
                            </div>

                            <x-phinix-form identifier="id" identifierValue="{{ $withdraw->method->form_id }}" />

                            @if(auth()->guard('agent')->user()->ts)
                                <div class="form-group">
                                    <label>@lang('Google Authenticator Code')</label>
                                    <input type="text" name="authenticator_code" class="form-control form--control" required>
                                </div>
                            @endif

                            <div class="form-group my-3">
                                <button type="submit" class="btn btn-info w-100">@lang('Submit')</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

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
