@extends($activeTheme. 'layouts.agent')
@section('agent')
    <div class="container mb-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6">
                <div class="card shadow bdr">
                    <div class="card-header text-center cardBg">
                        <h2>@lang('User cash in from agent')</h2>
                    </div>
                    <div class="card-body">
                        <div class="my-3">
                            <input name="mobile_username" placeholder="@lang('Enter user mobile number or username')" class="form-control" type="text" autocomplete="off">
                            <p id="error" class="text-danger"></p>
                            <p id="success" class="text-success"></p>
                        </div>
                        <div class="my-3">
                            <button class="btn btn-success userSubmitBtn" type="button">@lang('Submit')</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="cashInDiv" class="container mt-5"></div>
@endsection

@push('page-style')
    <style>
        .cardBg {
            background-color: #000;
        }
        .cardBg h2 {
            color: #fff;
        }
        .bdr {
            border:1px solid #e9e9e9;
        }
    </style>
@endpush

@push('page-script')
    <script>
        (function ($) {
            "use strict";

            $('.userSubmitBtn').on('click', function () {
                let mobileUsername = $('[name=mobile_username]').val();

                $.ajax({
                    headers: {'X-CSRF-TOKEN':"{{ csrf_token() }}"},
                    type: "post",
                    url: "{{ route('agent.cash.in.data') }}",
                    data: {
                        mobile_username:mobileUsername
                    },
                    dataType: "json",
                    success: function (response) {
                        if (response.success && response.userId) {
                            $('#error').empty();
                            $('#success').html(response.success);

                            $('#cashInDiv').html(`<div class="row d-flex justify-content-center">
                                                        <div class="col-md-6">
                                                            <div class="card shadow bdr">
                                                                <div class="card-header text-center cardBg">
                                                                    <h2>Cash In Process</h2>
                                                                </div>
                                                                <div class="card-body">
                                                                    <form action="{{ route('agent.cash.balance.store') }}" method="POST">
                                                                        @csrf
                                                                        <div class="my-3">
                                                                        <input type="number" id="input" step="any" name="amount" min="{{ getAmount($chargeSetting->cash_in_min) }}" max="{{ getAmount($chargeSetting->cash_in_max) }}" placeholder="@lang('Enter cash in money amount')" class="form-control" required>
                                                                            <div id="dropDown"></div>
                                                                        <input name="user_id" value="${response.userId}" type="hidden" />
                                                                        </div>
                                                                        <div class="my-3">
                                                                            <button class="btn btn-success userSubmitBtn" type="submit">@lang('Send Money')</button>
                                                                        </div>
                                                                      </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>`);
                        } else {
                            $('#success').empty();
                            $('#error').html(response.error);
                            $('#cashInDiv').empty();
                        }
                    }
                });
            });

            $(document).find('#cashInDiv' , '[name=amount]').on('input', function (e) {
                let amount              = $('[name=amount]').val();

                let cashInFixedCharge   = '{{ $chargeSetting->cash_in_charge_fixed }}';
                let cashInPercentCharge = '{{ $chargeSetting->cash_in_charge_percentage  }}';

                let percentCharge = (parseFloat(amount) * parseFloat(cashInPercentCharge)) /100;
                var finalCharge   = parseFloat(cashInFixedCharge) + parseFloat(percentCharge);
                var payable       = parseFloat(amount) + parseFloat(finalCharge);

                if ( amount ) {
                    $('#dropDown').empty();
                    $('#dropDown').html(`<div class="row">
                                            <div class="col-md-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <p><strong>@lang('Limit'): </strong> {{ showAmount($chargeSetting->cash_in_min) }}  {{ __($setting->site_cur) }} to  {{ showAmount($chargeSetting->cash_in_max) }} {{ __($setting->site_cur) }}</p>
                                                        <p><strong>@lang('Charge'): </strong><span> ${parseFloat(finalCharge.toFixed(2))}</span>  {{ __($setting->site_cur) }}</p>
                                                        <p><strong>@lang('Payable'): </strong> ${parseFloat(payable).toFixed(2)} {{ __($setting->site_cur) }}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>`);
                }else{
                    $('#dropDown').empty();
                }
            });
        })(jQuery);
    </script>
@endpush
