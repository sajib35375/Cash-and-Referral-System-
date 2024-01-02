@extends($activeTheme. 'layouts.auth')
@section('auth')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card custom--card shadow bdr">
                    <div class="card-header head">
                        <h5 class="card-title">@lang('KYC Form')</h5>
                    </div>
                    <div class="card-body">
                        <form action="" method="post" enctype="multipart/form-data">
                            @csrf

                            <x-phinixForm identifier="act" identifierValue="kyc" />

                            <div class="form-group">
                                <button type="submit" class="btn btn-info btn--base w-100">@lang('Submit')</button>
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
