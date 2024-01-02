@extends($activeTheme. 'layouts.auth')
@section('auth')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card shadow">
                    <div class="card-body p-4">
                        <h5 class="card-title fw-semibold mb-4">@lang('Send Money log')</h5>
                        <hr>
                        <div class="table-responsive">

                            <table class="table text-nowrap mb-0 align-middle table-bordered">
                                <thead class="text-dark fs-4">
                                <tr>
                                    <th class="border-bottom-0">
                                        <h6 class="fw-semibold mb-0">@lang('Serial Number')</h6>
                                    </th>
                                    <th class="border-bottom-0">
                                        <h6 class="fw-semibold mb-0">@lang('Receiver Name')</h6>
                                    </th>
                                    <th class="border-bottom-0">
                                        <h6 class="fw-semibold mb-0">@lang('Sender Name')</h6>
                                    </th>
                                    <th class="border-bottom-0">
                                        <h6 class="fw-semibold mb-0">@lang('Receiver Email')</h6>
                                    </th>
                                    <th class="border-bottom-0">
                                        <h6 class="fw-semibold mb-0">@lang('Sender Email')</h6>
                                    </th>
                                    <th class="border-bottom-0">
                                        <h6 class="fw-semibold mb-0">@lang('Receiver Amount')</h6>
                                    </th>
                                    <th class="border-bottom-0">
                                        <h6 class="fw-semibold mb-0">@lang('Sender Amount')</h6>
                                    </th>
                                    <th class="border-bottom-0">
                                        <h6 class="fw-semibold mb-0">@lang('Charge')</h6>
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                            @forelse($sendMoney as $data)
                                <tr>
                                    <td class="border-bottom-0">
                                        <h6 class="fw-semibold mb-1">{{ $loop->index + 1 }}</h6>
                                    </td>
                                    <td class="border-bottom-0">
                                        <h6 class="fw-semibold mb-1">{{ __(@$data->receiver->fullname) }}</h6>
                                    </td>
                                    <td class="border-bottom-0">
                                        <h6 class="fw-semibold mb-1">{{ __(@$data->sender->fullname) }}</h6>
                                    </td>
                                    <td class="border-bottom-0">
                                        <h6 class="fw-semibold mb-1">{{ __(@$data->receiver->email) }}</h6>
                                    </td>
                                    <td class="border-bottom-0">
                                        <h6 class="fw-semibold mb-1">{{ __(@$data->sender->email) }}</h6>
                                    </td>
                                    <td class="border-bottom-0">
                                        <h6 class="fw-semibold mb-1">{{ showAmount(@$data->receiver_amount) }} {{ __($setting->site_cur) }}</h6>
                                    </td>
                                    <td class="border-bottom-0">
                                        <h6 class="fw-semibold mb-1">{{ showAmount(@$data->sender_amount) }} {{ __($setting->site_cur) }}</h6>
                                    </td>
                                    <td class="border-bottom-0 ">
                                        <h6 class="fw-semibold mb-1 text-danger">{{ showAmount(@$data->charge) }} {{ __($setting->site_cur) }}</h6>
                                    </td>
                                </tr>

                            @empty
                                <tr>
                                    <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                </tr>
                            @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                    @if($sendMoney->hasPages())
                        <div class="card-footer">
                            {{ $sendMoney->links() }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
