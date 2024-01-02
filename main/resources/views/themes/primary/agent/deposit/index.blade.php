@extends($activeTheme. 'layouts.agent')
@section('agent')
    <div class="py-5 ">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <form action="">
                        <div class="mb-3 d-flex justify-content-end w-50">
                            <div class="input-group">
                                <input type="text" name="search" class="form-control" value="{{ request()->search }}" placeholder="@lang('Search by transactions')">
                                <button class="input-group-text bg-primary text-white">
                                    <i class="las la-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <div class="card custom--card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table custom--table">
                                    <thead>
                                        <tr>
                                            <th>@lang('Gateway | Transaction')</th>
                                            <th class="text-center">@lang('Initiated')</th>
                                            <th class="text-center">@lang('Amount')</th>
                                            <th class="text-center">@lang('Conversion')</th>
                                            <th class="text-center">@lang('Status')</th>
                                            <th>@lang('Details')</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($deposits as $deposit)
                                            <tr>
                                                <td>
                                                    <span class="fw-bold"> <span class="text-primary">{{ __($deposit->gateway->name) }}</span> </span>
                                                    <br>
                                                    <small> {{ $deposit->trx }} </small>
                                            </td>

                                            <td class="text-center">
                                                {{ showDateTime($deposit->created_at) }}<br>{{ diffForHumans($deposit->created_at) }}
                                            </td>
                                            <td class="text-center">
                                                {{ __($setting->cur_sym) }}{{ showAmount($deposit->amount ) }} + <span class="text-danger" title="@lang('charge')">{{ showAmount($deposit->charge)}} </span>
                                                <br>
                                                <strong title="@lang('Amount with charge')">
                                                {{ showAmount($deposit->amount+$deposit->charge) }} {{ __($setting->site_cur) }}
                                                </strong>
                                            </td>
                                            <td class="text-center">
                                                1 {{ __($setting->site_cur) }} =  {{ showAmount($deposit->rate) }} {{__($deposit->method_currency)}}
                                                <br>
                                                <strong>{{ showAmount($deposit->final_amo) }} {{__($deposit->method_currency)}}</strong>
                                            </td>
                                            <td class="text-center">
                                                @if($deposit->status == ManageStatus::PAYMENT_PENDING)
                                                    <span class="badge bg-warning">@lang('Pending')</span>
                                                @elseif($deposit->status == ManageStatus::PAYMENT_SUCCESS)
                                                    <span class="badge bg-success">@lang('Done')</span>
                                                @elseif($deposit->status == ManageStatus::PAYMENT_REJECT)
                                                    <span><span class="badge bg-danger">@lang('Canceled')
                                                @else
                                                    <span class="badge bg-dark">@lang('Initiated')</span>
                                                @endif
                                            </td>
                                                @php
                                                    $details = ($deposit->detail != null) ? json_encode($deposit->detail) : null;
                                                @endphp

                                                <td>
                                                    <a href="javascript:void(0)" class="btn btn-success btn-sm @if($deposit->method_code >= 1000) detailBtn @else disabled @endif"
                                                        @if($deposit->method_code >= 1000)
                                                            data-info="{{ $details }}"
                                                        @endif

                                                        @if ($deposit->status == ManageStatus::PAYMENT_REJECT)
                                                            data-admin_feedback="{{ $deposit->admin_feedback }}"
                                                        @endif
                                                        >
                                                        <i class="fa fa-desktop"></i>
                                                    </a>
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

                        @if($deposits->hasPages())
                            <div class="card-footer">
                                {{ $deposits->links() }}
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- APPROVE MODAL --}}
    <div id="detailModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Details')</h5>
                    <span type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </span>
                </div>
                <div class="modal-body">
                    <ul class="list-group agentData mb-2">
                    </ul>
                    <div class="feedback"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark btn-sm" data-bs-dismiss="modal">@lang('Close')</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('page-script')
    <script>
        (function ($) {
            "use strict";
            $('.detailBtn').on('click', function () {
                var modal = $('#detailModal');

                var agentData = $(this).data('info');
                var html = '';
                if(agentData){
                    let fileDownloadUrl = '{{ route("agent.file.download",["filePath" => "verify"]) }}';

                    agentData.forEach(element => {
                        if (!element.value) { return; }
                        if(element.type != 'file'){
                            html += `<li class="list-group-item d-flex justify-content-between align-items-center">
                                        <span>${element.name}</span>
                                        <span">${element.value}</span>
                                    </li>`;
                        } else {
                            html += `<li class="list-group-item d-flex justify-content-between align-items-center">
                                        <span>${element.name}</span>
                                        <span">
                                            <a href="${fileDownloadUrl}&fileName=${element.value}">
                                                <i class="las la-arrow-circle-down"></i> @lang('Attachment')
                                            </a>
                                        </span>
                                    </li>`;
                        }
                    });
                }
                modal.find('.agentData').html(html);

                if($(this).data('admin_feedback') != undefined){
                    var adminFeedback = `
                        <div class="my-3">
                            <strong>@lang('Admin Feedback')</strong>
                            <p>${$(this).data('admin_feedback')}</p>
                        </div>
                    `;
                }else{
                    var adminFeedback = '';
                }

                modal.find('.feedback').html(adminFeedback);
                modal.modal('show');
            });
        })(jQuery);

    </script>
@endpush
