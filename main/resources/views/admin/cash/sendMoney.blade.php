@extends('admin.layouts.master')
@section('master')
    <div class="wrap">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>@lang('Sender')</th>
                                    <th>@lang('Receiver')</th>
                                    <th>@lang('Sent Amount')</th>
                                    <th>@lang('Charge')</th>
                                    <th>@lang('Received Amount')</th>
                                    <th>@lang('Created At')</th>
                                </tr>
                            </thead>

                            <tbody class="table-border-bottom-0">
                                @forelse ($sendMoney as $data)
                                    <tr>
                                        <td>
                                            <span class="fw-bold">{{ __(@$data->sender->fullname) }}</span>
                                            <br>
                                            <span class="small">
                                                <a href="{{ route('admin.user.details', $data->sender->id) }}"><span>@</span>{{ __(@$data->sender->username) }}</a>
                                            </span>
                                        </td>
                                        <td>
                                            <span class="fw-bold">{{ __(@$data->receiver->fullname) }}</span>
                                            <br>
                                            <span class="small">
                                                <a href="{{ route('admin.user.details', $data->receiver->id) }}"><span>@</span>{{ __(@$data->receiver->username) }}</a>
                                            </span>
                                        </td>
                                        <td>{{ showAmount(@$data->sender_amount) }} {{ __($setting->site_cur) }}</td>
                                        <td><span class="text-danger">{{ showAmount(@$data->charge) }} {{ __($setting->site_cur) }}</span></td>
                                        <td>{{ showAmount(@$data->receiver_amount) }} {{ __($setting->site_cur) }}</td>
                                        <td>
                                            {{ showDateTime(@$data->created_at) }} <br>
                                            {{ diffForHumans(@$data->created_at) }}
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="100%" class="text-center">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    @if ($sendMoney->hasPages())
                        <hr class="mt-0">
                        <div class="card-footer pagination justify-content-center">
                            {{ paginateLinks($sendMoney) }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb')
    <x-searchForm placeholder="TRX / Username" dateSearch="yes" />
@endpush
