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
                                <th>@lang('Agent Name')</th>
                                <th>@lang('Agent Email')</th>
                                <th>@lang('Type')</th>
                                <th>@lang('Commission')</th>
                                <th>@lang('CreatedAt')</th>
                            </tr>
                            </thead>
                            <tbody class="table-border-bottom-0">
                                @forelse ($commission as $data)
                                <tr>
                                    <td>
                                        <span class="fw-bold">{{ __(@$data->agent->fullname) }}</span>
                                            <br>
                                        <span class="small">
                                            <a href="{{ route('admin.agent.details', $data->agent->id) }}"><span>@</span>{{ __(@$data->agent->username) }}</a>
                                        </span>
                                    </td>
                                    <td>{{ __(@$data->agent->email) }}</td>
                                    <td>{{ __(@$data->type) }}</td>
                                    <td>{{ showAmount(@$data->commission) }} {{ __($setting->site_cur) }}</td>
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
                </div>
            </div>
        </div>
    </div>

@endsection
@push('breadcrumb')
    <x-searchForm placeholder="TRX / Username" dateSearch="yes" />
@endpush
