@extends($activeTheme. 'layouts.agent')
@section('agent')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card shadow">
                    <div class="card-body p-4">
                        <h5 class="card-title fw-semibold mb-4">@lang('Cash Out log')</h5>
                        <hr>
                        <div class="table-responsive">
                            <table class="table text-nowrap mb-0 align-middle table-bordered">
                                <thead class="text-dark fs-4">
                                    <tr>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">@lang('Serial Number')</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">@lang('Username')</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">@lang('Email')</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">@lang('User Amount')</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">@lang('Agent Amount')</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">@lang('Charge')</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">@lang('Status')</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">@lang('Action')</h6>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($cashOut  as $data)
                                        <tr>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-1">{{ $loop->index + 1 }}</h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-1">{{ __(@$data->user->username) }}</h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-1">{{ __(@$data->user->email) }}</h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-1">{{ showAmount(@$data->user_amount) }} {{ __($setting->site_cur) }}</h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-1">{{ showAmount(@$data->agent_amount) }} {{ __($setting->site_cur) }}</h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-1 text-danger">{{ showAmount(@$data->charge) }} {{ __($setting->site_cur) }}</h6>
                                            </td>
                                            <td>
                                                @if(@$data->status == 1)
                                                    <button type="button" class="btn btn-sm btn-info m-1">Paid</button>
                                                @else
                                                    <button type="button" class="btn btn-sm btn-danger m-1">Unpaid</button>
                                                @endif
                                            </td>
                                            <td>
                                                @if(@$data->status == 1)
                                                @else
                                                    <a class="btn btn-success btn-sm m-1" href="{{ route('agent.cash.out.paid',$data->id) }}">Paid</a>
                                                @endif
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
                    @if($cashOut->hasPages())
                        <div class="card-footer">
                            {{ $cashOut->links() }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
