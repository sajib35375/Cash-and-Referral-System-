@extends($activeTheme. 'layouts.auth')
@section('auth')
    <div class="container mb-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-8">
                <div class="card shadow bdr">
                    <div class="card-header text-center cardBg">
                        <h2>@lang('User to User Send Money')</h2>
                    </div>
                    <div class="card-body">
                        <div class="my-3">
                            <input name="mobile_username" placeholder="@lang('Enter User mobile number or username')" class="form-control" type="text" autocomplete="off">
                            <p id="error" class="text-danger"></p>
                            <p id="success" class="text-success"></p>
                        </div>
                        <div class="my-3">
                            <button class="btn btn-info userSubmitBtn" type="button">@lang('Submit')</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="sendMoneyDiv" class="container mt-5"></div>
@endsection

@push('page-style')
    <style>
        .cardBg {
            background-color: #000000;
        }
        .cardBg h2 {
            color: #fff;
        }
        .bdr {
            border: 1px solid #e9e9e9;
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
                    url: "{{ route('user.get.data') }}",
                    data: {
                        mobile_username:mobileUsername
                    },
                    dataType: "json",
                    success: function (response) {
                        if (response.success && response.userId) {
                            $('#error').empty();
                            $('#success').html(response.success);

                            $('#sendMoneyDiv').html(`<div class="row d-flex justify-content-center">
                                                        <div class="col-md-8">
                                                            <div class="card shadow bdr">
                                                                <div class="card-header text-center cardBg">
                                                                    <h2>Send Money Process</h2>
                                                                </div>
                                                                <div class="card-body">
                                                                    <form action="{{ route('user.get.data.store') }}" method="POST">
                                                                        @csrf
                                                                        <div class="my-3">
                                                                            <input type="number" id="input" step="any" name="amount" min="{{ getAmount($chargeSetting->send_money_min) }}" max="{{ getAmount($chargeSetting->send_money_max) }}" placeholder="@lang('Enter send money amount')" class="form-control" required>
                                                                            <div id="dropDown"></div>
                                                                            <input name="user_id" value="${response.userId}" type="hidden" />
                                                                        </div>
                                                                        <div class="my-3">
                                                                            <button class="btn btn-dark userSubmitBtn" type="submit">@lang('Send Money')</button>
                                                                        </div>
                                                                      </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>`);
                        } else {
                            $('#success').empty();
                            $('#error').html(response.error);
                            $('#sendMoneyDiv').empty();
                        }
                    }
                });
            });

            $(document).find('#sendMoneyDiv' , '[name=amount]').on('input', function (e) {
                let amount            = $('[name=amount]').val();
                let sendFixedCharge   = '{{ $chargeSetting->send_money_charge_fixed }}';
                let sendPercentCharge = '{{ $chargeSetting->send_money_charge_percentage  }}';

                let percentCharge    = (parseFloat(amount) * parseFloat(sendPercentCharge)) /100;
                let finalCharge      = parseFloat(sendFixedCharge) + parseFloat(percentCharge);
                let receivable       = parseFloat(amount) - parseFloat(finalCharge)

                if (amount) {
                    $('#dropDown').empty();
                    $('#dropDown').html(`<div class="row">
                                            <div class="col-md-12">
                                                <div class="card shadow bdr">
                                                    <div class="card-body">
                                                        <p><strong>@lang('Limit'): </strong> {{ showAmount($chargeSetting->send_money_min) }}  {{ __($setting->site_cur) }} to  {{ showAmount($chargeSetting->send_money_max) }} {{ __($setting->site_cur) }}</p>
                                                        <p><strong>@lang('Charge'): </strong><span> ${parseFloat(finalCharge.toFixed(2))}</span> USD</p>
                                                        <p><strong>@lang('Receivable'): </strong> ${parseFloat(receivable).toFixed(2)} {{ __($setting->site_cur) }}</p>
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
