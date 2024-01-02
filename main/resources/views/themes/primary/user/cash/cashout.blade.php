@extends($activeTheme. 'layouts.auth')
@section('auth')
    <div class="container mb-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header text-center cardBg bdr">
                        <h2>@lang('User Cash Out From Agent')</h2>
                    </div>
                    <div class="card-body">
                        <div class="my-3">
                            <input name="mobile_username" placeholder="@lang('Enter Agent mobile number or username')" class="form-control" type="text">
                            <p id="err" class="text-danger"></p>
                            <p id="success" class="text-success"></p>
                        </div>
                        <div class="my-3">
                            <button id="submitBtn" type="button" class="btn btn-info">@lang('Submit')</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <div id="cashOutBox" class="container mt-5">
</div>
    <br><br><br>
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
            border: 1px solid #e9e9e9;
        }
    </style>
@endpush

@push('page-script')
    <script>
        (function ($){
            "use strict";

            $('#submitBtn').on('click', function () {
                let mobileUsername = $('[name="mobile_username"]').val();
                let action = '{{ route('user.cash.out.data') }}';

                let min = '{{ getAmount($charge->cash_out_min) }}';
                let max = '{{ getAmount($charge->cash_out_max) }}';

                $.ajax({
                    headers: {'X-CSRF-TOKEN':"{{ csrf_token() }}"},
                    url: action,
                    type: "json",
                    method: "POST",
                    data: {mobile_username:mobileUsername},
                    success: function(data) {
                        if (data.error) {
                            $('#success').text('')
                            $('#err').text(data.error)
                        }

                        if (data.success && data.agentId) {
                            $('#err').text('')
                            $('#success').text(data.success)

                            $('#cashOutBox').empty();
                            $('#cashOutBox').html(`<div class="row d-flex justify-content-center">
                                                    <div class="col-md-8">
                                                        <div class="card shadow">
                                                            <div class="card-header text-center cardBg bdr">
                                                                <h2>User Cash Out Input</h2>
                                                            </div>
                                                            <div class="card-body">
                                                                    <form action="{{ route('user.cash.out.store') }}" method="POST">
                                                                        @csrf
                                                                        <div class="my-3">
                                                                        <input min="${min}" max="${max}" id="amount" step="any" name="amount" placeholder="@lang('Enter your balance')" class="form-control" type="number" required>
                                                                        <input name="agent_id" value="${data.agentId}" type="hidden">
                                                                    </div>
                                                                    <div id="calculation"></div>
                                                                    <div class="my-3">
                                                                        <input class="btn btn-info" type="submit">
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>`);
                        } else {
                            $('#cashOutBox').empty();
                            $('#success').text('');
                            $('#error').text('');
                        }
                    }
                });
            });

            $(document).find('#cashOutBox' , '#amount').on('input', function (e) {
                let amount = $('#amount').val();

                let cashOutFixCharge = {{ $charge->cash_out_charge_fixed }};
                let cashoutParcentCharge = ({{ $charge->cash_out_charge_percentage }} * parseFloat(amount) / 100);
                let finalcharge = parseFloat(cashOutFixCharge) + parseFloat(cashoutParcentCharge);
                let payable = parseFloat(amount) + parseFloat(finalcharge);

                let min = '{{ showAmount($charge->cash_out_min) }}';
                let max = '{{ showAmount($charge->cash_out_max) }}';

                if (amount) {
                    $('#calculation').empty();
                    $('#calculation').html(`<div class="row">
                                                <div class="col-md-12">
                                                    <div class="card shadow bdr">
                                                        <div class="card-body">
                                                            <p><strong>@lang('Limit') : </strong><span>${min}</span>{{ __($setting->site_cur) }} to <span>${max}</span> {{ __($setting->site_cur) }} </p>
                                                            <p><strong>@lang('Charge'): </strong><span>${finalcharge}</span>{{ __($setting->site_cur) }}</p>
                                                            <p><strong>@lang('Payable'): </strong><span>${payable}</span>{{ __($setting->site_cur) }}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>`);
                } else {
                    $('#calculation').empty()
                }
            });
        })(jQuery)
    </script>
@endpush
