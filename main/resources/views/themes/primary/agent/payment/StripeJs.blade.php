@extends($activeTheme. 'layouts.agent')
@section('agent')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card custom--card shadow bdr">
                    <div class="card-header head">
                        <h5 class="card-title">@lang('Stripe Storefront')</h5>
                    </div>

                    <div class="card-body p-5">
                        <form action="{{$data->url}}" method="{{$data->method}}">
                            @csrf
                            <ul class="list-group text-center">
                                <li class="list-group-item d-flex justify-content-between">
                                    @lang('You have to pay '):
                                    <strong>{{showAmount($deposit->final_amo)}} {{__($deposit->method_currency)}}</strong>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    @lang('You will get '):
                                    <strong>{{showAmount($deposit->amount)}}  {{__($setting->aite_cur)}}</strong>
                                </li>
                            </ul>
                            <script src="{{$data->src}}"
                                class="stripe-button"
                                @foreach($data->val as $key=> $value)
                                data-{{$key}}="{{$value}}"
                                @endforeach
                            >
                            </script>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('page-script-lib')
    <script src="https://js.stripe.com/v3/"></script>
@endpush

@push('page-script')
    <script>
        (function ($) {
            "use strict";
            $('button[type="submit"]').removeClass().addClass("btn btn--base w-100 mt-3").text("Pay Now").css('background-color','#10BD9D');
        })(jQuery);
    </script>
@endpush

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
