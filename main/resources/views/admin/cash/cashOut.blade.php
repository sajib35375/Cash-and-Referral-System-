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
                                <th>@lang('User Name')</th>
                                <th>@lang('Agent Name')</th>
                                <th>@lang('User Amount')</th>
                                <th>@lang('Agent Amount')</th>
                                <th>@lang('Charge')</th>
                                <th>@lang('Created At')</th>
                                <th>@lang('Status')</th>
                            </tr>
                        </thead>

                        <tbody class="table-border-bottom-0">
                         @forelse ($cashOut as $data)
                            <tr>
                                <td>
                                    <span class="fw-bold">{{ __(@$data->user->fullname) }}</span>
                                        <br>
                                    <span class="small">
                                        <a href="{{ route('admin.user.details', $data->user->id) }}"><span>@</span>{{ __(@$data->user->username) }}</a>
                                    </span>
                                </td>
                                <td>
                                    <span class="fw-bold">{{ __(@$data->agent->fullname) }}</span>
                                    <br>
                                    <span class="small">
                                        <a href="{{ route('admin.agent.details', $data->agent->id) }}"><span>@</span>{{ __(@$data->agent->username) }}</a>
                                    </span>
                                </td>
                                <td>{{ showAmount(@$data->user_amount) }} {{ __($setting->site_cur) }}</td>
                                <td>{{ showAmount(@$data->agent_amount) }} {{ __($setting->site_cur) }}</td>
                                <td><span class="text-danger">{{ showAmount(@$data->charge) }} {{ __($setting->site_cur) }}</span></td>
                                <td>
                                    {{ showDateTime(@$data->created_at) }}<br>
                                    {{ diffForHumans(@$data->created_at) }}
                                </td>
                                <td>
                                    @if($data->status == 1)
                                        <span class="badge bg-label-success">@lang('Paid')</span>
                                    @else
                                        <span class="badge bg-label-danger">@lang('UnPaid')</span>
                                    @endif
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
            </div>
        </div>
    </div>
</div>
@endsection

@push('breadcrumb')
    <x-searchForm placeholder="Username / Email" dateSearch="yes" />
@endpush
