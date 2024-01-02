@extends($activeTheme. 'layouts.auth')
@section('auth')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card custom--card shadow bdr">
                    <div class="card-header card-header-bg bgc">
                        <h5 class="card-title">{{__($pageTitle)}}</h5>
                    </div>
                    <div class="card-body  ">
                        <form action="{{ route('user.deposit.manual.update') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <p class="text-center mt-2">@lang('You have requested') <b class="text-success">{{ showAmount($deposit['amount'])  }} {{__($setting->site_cur)}}</b> , @lang('Please pay')
                                        <b class="text-success">{{showAmount($deposit['final_amo']) .' '.$deposit['method_currency'] }} </b> @lang('for successful payment')
                                    </p>
                                    <h4 class="text-center mb-4">@lang('Please follow the instruction below')</h4>

                                    <p class="my-4 text-center">@php echo  $deposit->gateway->guideline @endphp</p>

                                </div>

                                <x-phinix-form identifier="id" identifierValue="{{ $gateway->form_id }}" />

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-info w-100">@lang('Pay Now')</button>
                                    </div>
                                </div>
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
        .bgc {
            background-color: #000;
        }
        .bgc h5 {
            color: #fff;
        }
    </style>
@endpush
